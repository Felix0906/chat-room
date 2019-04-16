# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from socket import *
from time import sleep


class Client(object):

    def __init__(self):
        HOST = '127.0.0.1'
        PORT = 8888
        ADDR = (HOST, PORT)
        self.s = socket(AF_INET, SOCK_STREAM)
        self.s.connect(ADDR)

    def send_info(self, str1):
        self.s.send(str1.encode())

    def recv_info(self):
        data = self.s.recv(1024)
        return data.decode()

    def up_load(self, filename):
        print("up_load里面的filename",filename)
        fd = open(filename, "rb")
        data = self.s.recv(1024).decode()
        if data == 'be ready':
            for line in fd:
                self.s.send(line)
            sleep(0.1)
            self.s.send(b"##over")
            print('%s文件上传成功' % filename)
            return
        else:
            print('%s文件上传失败' % filename)
            return

    def down_load(self, filename):  # filename处是客户选择的路径加文件名
        data = self.s.recv(1024).decode()
        if data == 'be ready':
            fd = open(filename, "w")
            while True:
                data = self.s.recv(1024).decode()
                if data == '##over':
                    break
                fd.write(data)
            fd.close()
            print("%s下载完成" % filename)
            return
        else:
            print('下载失败')
            return




