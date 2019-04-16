# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from tkinter.simpledialog import *
import threading
from tkinter import *
import tkinter.filedialog
import tkinter.messagebox
import time
from client import Client


def chat_window(client=None, user=''):
    Cle = client
    MYNAME = user

    def send():
        info = info_inp.get(0.0, END)
        if not var.get():
            warnwer = tkinter.messagebox.showwarning('警告', '你要和谁聊天？')
            return
        if info == '\n' or info=='\n\n':
            warnwer = tkinter.messagebox.showwarning('警告', '消息不能为空')
            # info_inp.insert(4.0,s)
            print('消息不能为空')
        else:
            # print(info)
            s = '我-->' + time.ctime() + ':\n\t' + info+'\n'
            txt.insert(END, s)
            txt.see(END)

            s1 = MYNAME + '#$$' + \
                var.get() + '#$$' + time.ctime() + '#$$' + info
            Cle.send_info(s1)
            print(s1)
            info_inp.delete(0.0,END)

    def send2(event):
        info = info_inp.get(0.0, END)
        if not var.get():
            warnwer = tkinter.messagebox.showwarning('警告', '你要和谁聊天？')
            return
        if info == '\n' or info=='\n\n' or info=='\n\n\n':
            warnwer = tkinter.messagebox.showwarning('警告', '消息不能为空')
            # info_inp.insert(4.0,s)
            print('消息不能为空')
        else:
            # print(info)
            s = '我-->' + time.ctime() + ':\n\t' + info+'\n'
            txt.insert(END, s)
            txt.see(END)

            s1 = MYNAME + '#$$' + \
                var.get() + '#$$' + time.ctime() + '#$$' + info
            print(s1)
            Cle.send_info(s1)
            info_inp.delete(0.0,END)

    def recv_info(Cle,txt):
        while True:
            data = Cle.recv_info()
            print(data)
            if data[0:3]=='##u':
                friend_list = data.split('##u')
                friend_list.remove('')
                Lstbox.delete(0,END)
                for i in friend_list:
                    Lstbox.insert(END, i)
                info1 = tkinter.messagebox.showinfo('成功', '添加好友/群聊成功!')
            elif data == 'error':
                info1 = tkinter.messagebox.showinfo('fail', '昵称/群聊输错啦!')
                print('昵称输错啦')
            else:
                txt.insert(END, data)
                txt.see(END)
    def add_friend():
        fri = askstring('添加好友','请输入昵称：')
        fri = '##A'+fri+'##A'+MYNAME
        Cle.send_info(fri)

    def group_chat():#发起群聊功能，建立一个新群
        lst = [] 
        def run():
            groupname = inp.get()
            if not groupname:
                  warnwer = tkinter.messagebox.showwarning('警告', '请输入群聊名称！')
            else:
                s = ''
                for va in lst:
                    if va.get()=='':
                        continue
                    else:
                        s += ' '
                        s += va.get()
                if s =='':
                    warnwer = tkinter.messagebox.showwarning('警告', '请选好友')
                else:
                    s = '##G '+groupname+' '+MYNAME+s
                    print(s)
                    Cle.send_info(s)
                s1 = '添加群聊成功!'
                lb.config(text=s1)
                time.sleep(1)
                groupChat.destroy()

        def close():
            groupChat.destroy()
        groupChat = Toplevel(chat_w)
        groupChat.title('发起群聊')
        lbn = Label(groupChat,text='群聊名称：')
        lbn.pack()
        inp = Entry(groupChat)
        inp.pack()
        print(friend_list)
        for i in friend_list[1:]:
            CheckVar=StringVar()
            ch  = Checkbutton(groupChat,text=i,variable=CheckVar,onvalue =i,offvalue='')
            lst.append(CheckVar)
            ch.pack()
        lb = Label(groupChat,text='请选择好友！')
        lb.pack()
        bt1 = Button(groupChat,text='OK',command=run)
        bt1.pack()
        bt2 = Button(groupChat,text='Close',command=close)
        bt2.pack()

        groupChat.mainloop()

    def close():
        pass

    def slecurse1(event):
        var.set(Lstbox.get(Lstbox.curselection()))

    def chos_file():
        filename = tkinter.filedialog.askopenfilename()
        if filename != '':
            print('您选择的文件是：', filename)
            l = filename.split('/')
            print(l)
            new_filename = "$$Up "+l[-1]
            print(new_filename)
            Cle.send_info(new_filename)
            time.sleep(0.1)
            Cle.up_load(l[-1])
            print("文件上传成功！")
        else:
            print('您没有选择任何文件')

    chat_w = Tk()
    chat_w.title('chat room')
    chat_w.geometry('800x600')
    chat_w.bind('<Return>',send2)
    chat_w.focus_set()
    
    var = StringVar()

    txt = Text(chat_w, font=('宋体', 14))
    txt.place(relx=0.01, rely=0.06, relwidth=0.70, relheight=0.58)

    info_inp = Text(chat_w, font=('宋体', 16))
    
    info_inp.place(relx=0.01, rely=0.65, relheight=0.34, relwidth=0.70)

    bt_send = Button(chat_w, text='发送(s)', font=('黑体', 12),
                     command=send, activebackground='pink')
    
    bt_send.place(relx=0.625, rely=0.925, relwidth=0.075, relheight=0.055)

    bt_close = Button(chat_w, text='关闭(C)', font=('黑体', 12),
                      command=close, activebackground='pink')
    bt_close.place(relx=0.545, rely=0.925, relwidth=0.075, relheight=0.055)

    file_gif = PhotoImage(file='file_button.gif')
    bt_file = Button(chat_w, image=file_gif, command=chos_file)
    bt_file.place(relx=0.012, rely=0.893)

    voice_gif = PhotoImage(file='voice_button.gif')
    bt_voice = Button(chat_w, image=voice_gif, command=close)
    bt_voice.place(relx=0.09, rely=0.893)

    Lstbox = Listbox(chat_w)
    Lstbox.bind('<ButtonRelease-1>',slecurse1)
    Lstbox.place(relx=0.712, rely=0.06, relwidth=0.285, relheight=0.70)

    bt_addfriend = Button(chat_w, text='添加朋友', command=add_friend, font=('黑体', 13))
    bt_addfriend.place(relx=0.73, rely=0.77, relwidth=0.12, relheight=0.05)

    bt_groupchat = Button(chat_w, text='发起群聊', command=group_chat, font=('黑体', 13))
    bt_groupchat.place(relx=0.86, rely=0.77, relwidth=0.12, relheight=0.05)

    lb1 = Label(chat_w, textvariable=var, font=('宋体', 14))
    lb1.place(relx=0.01, rely=0.01)

    lb2 = Label(chat_w, text='朋友列表~~:', font=('宋体', 14))
    lb2.place(relx=0.72, rely=0.01)

    data = Cle.recv_info()
    friend_list = data.split(' ')
    for i in friend_list:
        Lstbox.insert(END, i)

    t = threading.Thread(target=recv_info,args=(Cle,txt))
    t.start()

    
   
    chat_w.mainloop()
