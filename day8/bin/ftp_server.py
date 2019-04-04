#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# Author：Beck Yeh
# Create date：2019/3/31
# Propuse：Pratice SocketServer module

import socketserver

class MyFTPServer(socketserver.BaseRequestHandler):

    def handle(self):
        self.auth = False



if __name__ == '__main__':
    server = socketserver.ThreadingTCPServer(('127.0.0.1', 9000), MyFTPServer)
    server.serve_forever()
