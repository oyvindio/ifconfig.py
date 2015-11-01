#!/usr/bin/env python
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals
import os
import sys
import requests
import socket


def ipaddr_response():
    res = requests.get('http://oyvind.io/ip')
    res.raise_for_status()
    if sys.version_info.major > 2:
        return res.content.decode('utf-8')
    else:
        return res.content

def is_valid_ipaddr(address_family, ipaddr):
    try:
        socket.inet_pton(address_family, ipaddr)
        return True
    except OSError:
        return False

if __name__ == '__main__':
    if sys.stdout.isatty() and not os.getenv('TERM') == 'dumb':
        def ok(): print('\033[92mSmoketest OK\033[0m')
        def fail(): sys.exit('\033[91mSmoketest FAILED\033[0m')
    else:
        def ok(): print('Smoketest OK')
        def fail(): sys.exit('Smoketest FAILED')

    try:
        ipaddr = ipaddr_response()
    except requests.exceptions.HTTPError:
        fail()

    if is_valid_ipaddr(socket.AF_INET, ipaddr) or is_valid_ipaddr(socket.AF_INET6, ipaddr):
        ok()
    else:
        fail()
