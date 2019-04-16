#-*-coding:utf-8 -*-
# from __future__ import unicode_literals
import time
from tkinter import *
import tkinter.filedialog
import tkinter.messagebox
from client import Client
from chat_window import *


Cle = Client()


def sign_log():
    def login():
        user = inp1.get()
        passwd = inp2.get()
        Cle.send_info('##L %s %s' % (user, passwd))
        result = Cle.recv_info()
        if result == 'no':
            s = '用户名或密码错误'
            lab3.config(text=s)
            inp1.delete(0, END)
            inp2.delete(0, END)
        elif result == 'ok':
            s = 'sign secussful'
            lab3.config(text=s)
            time.sleep(1)
            top.destroy()
            chat_window(Cle, user)
        else:
            print('服务器错误')

        # 形成新的窗口，显示朋友列表
    # 注册的窗口
    def sign_new():
        Cle.send_info('sign_new')

        def signinfo():
            name = inp1.get()
            passwd = inp2.get()
            passwd2 = inp3.get()
            email = inp4.get()
            phone = inp5.get()
            if passwd != passwd2:
                s = '两次密码不一样哦！'
                lb6.config(text=s)
                return
            L = [name, passwd, email, phone]
            s1 = ' '.join(L)
            Cle.send_info(s1)
            result = Cle.recv_info()
            if result == 'ok':
                s = '注册成功，请用用户名和密码登录吧！'
                lb6.config(text=s)
            else:
                s = '注册失败，检查下信息吧'
                lb6.config(text=s)

        def func1():
            winNEW.destroy()

        winNEW = Toplevel(top)
        winNEW.geometry('400x500')
        winNEW.title('注册新用户')
        lb1 = Label(winNEW, text='起个好听的名字吧：', fg='blue', font=('黑体', 14))
        lb1.place(relx=0.05, rely=0.1, relwidth=0.45, relheight=0.08)
        inp1 = Entry(winNEW)
        inp1.place(relx=0.5, rely=0.1, relwidth=0.45, relheight=0.08)
        lb2 = Label(winNEW, text='请输入密码：', fg='blue', font=('黑体', 14))
        lb2.place(relx=0.05, rely=0.22, relwidth=0.45, relheight=0.08)
        inp2 = Entry(winNEW, show='*')
        inp2.place(relx=0.5, rely=0.22, relwidth=0.45, relheight=0.08)
        lb3 = Label(winNEW, text='再重复输入密码：', fg='blue', font=('黑体', 14))
        lb3.place(relx=0.05, rely=0.34, relwidth=0.45, relheight=0.08)
        inp3 = Entry(winNEW, show='*')
        inp3.place(relx=0.5, rely=0.34, relwidth=0.45, relheight=0.08)

        lb4 = Label(winNEW, text='请输入邮箱：', fg='blue', font=('黑体', 14))
        lb4.place(relx=0.05, rely=0.46, relwidth=0.45, relheight=0.08)
        inp4 = Entry(winNEW)
        inp4.place(relx=0.5, rely=0.46, relwidth=0.45, relheight=0.08)

        lb5 = Label(winNEW, text='请输入手机号码：', fg='blue', font=('黑体', 14))
        lb5.place(relx=0.02, rely=0.58, relwidth=0.45, relheight=0.08)
        inp5 = Entry(winNEW)
        inp5.place(relx=0.5, rely=0.58, relwidth=0.45, relheight=0.08)

        lb6 = Label(winNEW, text='', font=('黑体', 15))
        lb6.place(relx=0.05, rely=0.7, relheight=0.08, relwidth=0.9)

        bt1 = Button(winNEW, text='注册', command=signinfo,
                     bg='yellow', fg='red', font=('黑体', 15))
        bt1.place(relx=0.05, rely=0.82, relwidth=0.4, relheight=0.1)
        bt2 = Button(winNEW, text='退出', command=func1,
                     bg='yellow', fg='red', font=('黑体', 15))
        bt2.place(relx=0.55, rely=0.82, relwidth=0.4, relheight=0.1)

        winNEW.mainloop()

    top = Tk()
    top.geometry('300x300')
    top.title('登录')

    lab1 = Label(top, text='输入用户名：', font=('黑体', 15))
    lab1.place(relx=0.2, rely=0.05, relwidth=0.6, relheight=0.10)
    inp1 = Entry(top)
    inp1.place(relx=0.2, rely=0.15, relwidth=0.6, relheight=0.10)
    lab2 = Label(top, text='输入密码：', font=('黑体', 15))
    lab2.place(relx=0.2, rely=0.27, relwidth=0.6, relheight=0.10)
    inp2 = Entry(top, show='*')
    inp2.place(relx=0.2, rely=0.37, relwidth=0.6, relheight=0.10)
    lab3 = Label(top, text='', font=('黑体', 15))
    lab3.place(relx=0.2, rely=0.50, relwidth=0.6, relheight=0.10)

    bt1 = Button(top, text='登录', command=login)
    bt1.place(relx=0.1, rely=0.7, relwidth=0.35, relheight=0.1)
    bt2 = Button(top, text='注册', command=sign_new)
    bt2.place(relx=0.55, rely=0.7, relwidth=0.35, relheight=0.1)

    top.mainloop()
    # while True:
    #     pass


sign_log()
