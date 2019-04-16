from pymysql import *


class Mysql_conn(object):

    def __init__(self):
        self.conn = connect(host='localhost', port=3306,
            database='user_info', user='root',
            passwd='*****', charset='utf8')
        self.cursor = self.conn.cursor()

    def __del__(self):
        self.cursor.close()

    def execute_info(self, l):
        self.cursor.execute('use user_info;')
        sql_select = '''insert into user_info \
        values(0,"%s","%s","%s","%s");''' % tuple(l)
        try:
            self.cursor.execute(sql_select)
            self.conn.commit()
        except pymysql.err.DataError:
            self.conn.rollback()
            raise DataError

    def execute_login(self, l):
        print('数据库已连接。。')
        self.cursor.execute('use user_info;')
        sql_select = '''select * from user_info\
         where user="%s" and passwd="%s";''' % (l[0], l[1])
        self.cursor.execute(sql_select)
        data = self.cursor.fetchall()
        print(data)
        return bool(data)

    def create_friendslist(self, username):
        print('准备开始建立好友列表。。。')
        sql_select = '''create table %s 
                        (id int primary key auto_increment,
                        friend_name varchar(20)) 
                        default charset=utf8;''' % username
        try:
            self.cursor.execute(sql_select)
            print('建表成功')
            print('开始插入第一条。。。')
            sql_select1 = '''insert into %s 
                            values (0, "%s")''' % (username, username)
            self.cursor.execute(sql_select1)
            self.conn.commit()
            print('插入第一条好友信息完成。。。')
        except:
            self.conn.rollback()

    def add_friends(self, name1, name2):
        print('开始添加好友到数据库．．．')
        self.cursor.execute('use user_info;')
        print(name1, name2)
        sql_select = '''insert into %s values (0, "%s");''' % (name2, name1)
        try:
            self.cursor.execute(sql_select)
            self.conn.commit()
        except:
            self.conn.rollback()
            return

    def get_friendslist(self, username):
        print('准备发送好友列表。。。')
        self.cursor.execute('use user_info;')
        sql_select = '''select friend_name 
                         from %s;''' % username
        self.cursor.execute(sql_select)
        data = self.cursor.fetchall()
        print(data)
        return data

    def sign_check_friend(self, name):
        print('开始检查用户名是否存在．．．')
        self.cursor.execute('use user_info;')
        sql_select = '''select user from user_info\
         where user="%s";''' % name
        self.cursor.execute(sql_select)
        data = self.cursor.fetchall()
        return bool(data)

    def check_friend(self, name1, name2):
        print('开始检查用户名是否存在．．．')
        self.cursor.execute('use user_info;')
        sql_select = '''select user from user_info\
         where user="%s";''' % name1
        self.cursor.execute(sql_select)
        data1 = self.cursor.fetchall()
        print('开始检查自己的好友列表中是否已存在此人。。。。')
        sql_select = '''select friend_name from %s\
         where friend_name="%s";''' % (name2, name1)
        self.cursor.execute(sql_select)
        data2 = self.cursor.fetchall()
        print('用户名核查完毕')
        if bool(data1):
            if bool(data2):
                return False
            else:
                return True
        else:
            return False

    def save_message(self, name1, name2, time, msg):  # 要存到谁的离线表，消息
        print('开始保存离线消息')
        name = name1 + '_unread_info'
        self.cursor.execute('use user_info;')
        print(name2)
        sql_select = '''insert into %s (friend,Time,unread_info)
                        values("%s","%s","%s");''' % (name, name2, time, msg)
        try:
            self.cursor.execute(sql_select)
            self.conn.commit()
            print('离线消息存储成功！')
        except:
            self.conn.rollback()
            return

# update rrr_unread_info set read_state = 1 where read_state = 0;
# select friend, Time, unread_info from rrr_unread_info where read_state = 1;
    def get_unread_msg(self, name):
        print('开始获取离线消息。。。。')
        name = name + '_unread_info'
        self.cursor.execute('use user_info;')
        sql_select = '''select unread_info from %s 
                         where read_state=0;''' % name
        try:
            self.cursor.execute(sql_select)
            data = self.cursor.fetchall()
            sql_select2 = '''update %s set read_state=1 
                             where read_state=0;''' % name
            self.cursor.execute(sql_select2)
            self.conn.commit()
            return data
            # print('离线消息获取完毕，用户正在聊天中。。。。')
        except:
            self.conn.rollback()
            return

    def create_unread_list(self, name):
        new_name = name + '_unread_info'
        print(new_name)
        print('准备开始建立离线消息列表。。。')
        self.cursor.execute('use user_info;')
        sql_select = '''create table %s 
                    (friend varchar(128) not NULL,
                    Time varchar(128) not NULL,
                    unread_info varchar(8192) not NULL,
                    read_state tinyint default 0) 
                    default charset=utf8;''' % new_name
        try:
            self.cursor.execute(sql_select)
            self.conn.commit()
            print('创建离线消息列表成功。。。。')
            self.cursor.close()
            self.conn.close()
            return
        except:
            self.conn.rollback()
            return

    def create_grouplist(self, lst):
        print(lst)
        # try:
        group_name = lst[0]
        print('开始创建此群成员表....')
        self.cursor.execute('''use user_info;''')
        sql_select = '''create table %s \
        (id int primary key auto_increment,\
        friend_name varchar(20) not NULL)default charset=utf8;''' % group_name
        self.cursor.execute(sql_select)
        # print('')
        for i in lst[1:]:
            sql_select2 = '''insert into %s values\
                           (0, "%s");''' % (group_name, i)
            self.cursor.execute(sql_select2)
        self.conn.commit()
        # self.cursor.close()
        # self.conn.close()
        print('群成员表已建立完成！')
        return True
        # except:
        #     self.cursor.rollback()
        #     print("群好友表创建失败！")
        #     return

    def update_grouplist(self, lst):
        new_group_name = "[群聊]" + lst[0]
        print('开始更新每个群成员的好友列表。。。')
        for i in lst[1:]:
            self.cursor.execute("use user_info;")
            sql_select = '''insert into %s \
                             values(0, "%s");''' % (i, new_group_name)
            self.cursor.execute(sql_select)
        self.conn.commit()
        print('已更新所有群聊内成员的朋友列表。。。')
        return

    def add_file(self, filename):
        print('开始将用户上传的文件名加入数据库')
        self.cursor.execute('''use user_info;''')
        sql = '''insert into up_file values(0, "%s");''' % filename
        self.cursor.execute(sql)
        self.conn.commit()
        print('文件名存入成功')

# mysql里面建一个表，存放用户上传的文件名
    def check_file(self, filename):
        self.cursor.execute('use user_info;')
        sql = '''select * from up_file 
                         where filename="%s";''' % filename
        self.cursor.execute(sql)
        data = self.cursor.fetchall()
        print('用户下载的文件已核查完毕。。')
        return bool(data)

    def get_filenamelist(self):
        self.cursor.execute('''use user_info;''')
        sql = '''select filename from file_name;'''
        self.cursor.execute(sql)
        data = self.cursor.fetchall()
        return data

