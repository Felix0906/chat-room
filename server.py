from socket import *
from server_mysql import Mysql_conn
import select
import time
import sys


def do_addfriend(data, r): 
    mysql_obj = Mysql_conn()
    data1 = data.split('##A')
    friend_name = data1[1]
    my_name = data1[2]
    print('添加好友时，给服务器发的信息：', data1)
    if mysql_obj.check_friend(friend_name, my_name):
        print('开始添加好友到好友列表中．．．')
        mysql_obj.add_friends(data1[1], data1[2]) 
        print('好友添加成功．．')
        data2 = mysql_obj.get_friendslist(data1[2])
        L = list(data2)
        s = '##u'.join([str(n) for t in L for n in t])
        s = '##u' + s
        print(s)
        r.send(s.encode())
    else:
        r.send('error'.encode())
        return


def send_info(data, dic):
    data1 = data.split('#$$')
    if len(data1) == 4:
        text1 = '%s-->%s:\n\t%s\n' % (data1[0], data1[2], data1[-1])
        if data1[1] in dic:
            dic[data1[1]].send(text1.encode())
        else:
            obj0 = Mysql_conn()
            obj0.save_message(data1[1], data1[0], data1[2], text1)
    else:
        print('消息发送失败，接收有误')
        return


def do_login(data, dic, r):  # 登录
    obj1 = Mysql_conn()
    l = data.split(' ')
    l.remove('##L')
    if obj1.execute_login(l):
        dic[l[0]] = r
        r.send(b'ok')
        # 获取好友列表
        data1 = obj1.get_friendslist(l[0])
        L = list(data1)
        data1 = ' '.join([str(n) for t in L for n in t])
        print(data1)
        r.send(data1.encode())
        time.sleep(3)
        s = obj1.get_unread_msg(l[0])
        if bool(s):
            for i in s:
                for msg in i:
                    r.send(msg.encode())
                    time.sleep(0.5)
            return
        else:
            return
    else:
        r.send(b'no')
        return


def do_sign(c):  # 注册
    while True:
        obj = Mysql_conn()
        data = c.recv(1024).decode()
        data = str(data)
        l = data.split(' ')
        if not obj.sign_check_friend(l[0]):
            try:
                obj.execute_info(l)
            except:
                c.send(b'error')
                return
            obj.create_friendslist(l[0])  # 在数据库创建好友列表
            obj.create_unread_list(l[0])  # 在数据库创建离线消息列表
            c.send(b'ok')
            return
        else:
            c.send(b'error')
            return


def do_group(data,dic,r):
    data1 = data.split(' ')
    data1.remove('##G')
    obj_group = Mysql_conn()
    
    obj_group.create_grouplist(data1)
    print('finish')
    obj_group.update_grouplist(data1)
    data2 = obj_group.get_friendslist(data1[1])
    L = list(data2)
    s = '##u'.join([str(n) for t in L for n in t])
    s = '##u' + s
    print(s)
    r.send(s.encode())


def do_group_chat(data,dic):
    data1 = data.split('#$$')
    if len(data1) == 4:
        text1 = data1[1] + '%s-->%s:\n\t%s\n' % (data1[0], data1[2], data1[-1])
        obj_group1 = Mysql_conn()
        print(data1[1][4:])
        data0 = obj_group1.get_friendslist(data1[1][4:])
        L = list(data0)
        my_name = data1[0]
        l1 = []
        for i in L:
            for j in i:
                l1.append(j)

        for i in l1:
            if i in dic:
                if i != my_name:
                    dic[i].send(text1.encode())
            else:
                obj_x = Mysql_conn()
                obj_x.save_message(i, data1[0], data1[2], text1)
    return


def do_upload(data, r):
    filename = data.split(' ')[-1]
    obj = Mysql_conn()
    try:
        fd = open(FILE_PATH + filename, 'w')
    except:
        print('失败')
        return
    r.send(b'be ready')
    while True:
        data = r.recv(1024).decode()
        if data == '##over':
            break
        fd.write(data)
    obj.add_file(filename)
    print('文件接收完毕')
    return

# 待完善
def do_download(data, r):
    obj = Mysql_conn()
    t = obj.get_filenamelist()
    filenamelist = []
    for i in t:
        for f in i:
            filenamelist.append(f)
    s = ' '.join(filenamelist)
    r.send(s.encode())
    filename = data.split(' ')[-1]

    if obj.check_file(filename):
        fd = open(filename, 'rb')
        r.send(b'be ready')
        for line in fd:
            r.send(line)
        time.sleep(0.1)
        r.send(b'##over')
        fd.close()
        print('已下载完毕')
        return
    else:
        r.send('no such file')
        return


HOST = '127.0.0.1'
PORT = 8888
ADDR = (HOST, PORT)
s = socket(AF_INET, SOCK_STREAM)
s.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
s.bind(ADDR)
s.listen(5)
rlist = [s]
wlist = []
xlist = [s]

online_user = {}
FILE_PATH = '********************'

while True:
    rs, ws, es = select.select(rlist, wlist, xlist)
    for r in rs:
        if r is s:
            c, addr = r.accept()
            rlist.append(c)
        else:
            data = r.recv(1024).decode()

            if data == 'sign_new':
                do_sign(r)

            elif data[0:3] == '##A':
                do_addfriend(data, r)

            elif data[0:6] == '##L #Q':
                sys.exit(0)

            elif data[0:3] == '##L':
                do_login(data, online_user, r)

            elif not data:
                rlist.remove(r)
                r.close()
                print('客户端退出！')
            
            elif data[0:3] == '##G':
                do_group(data,online_user,r)

            elif data[0:4] == '$$Up':
                print('服务器已接收到上传文件请求。。')
                do_upload(data, r)

            elif data[0:4] == '$$Down':
                print('服务器已接收到客户下载文件的请求。。')
                do_download(data, r)

            elif data.split('#$$')[1][0:4] == '[群聊]':
                do_group_chat(data,online_user)

            else:
                print(data)
                send_info(data, online_user)

    for w in ws:
        pass
    for e in es:
        pass




