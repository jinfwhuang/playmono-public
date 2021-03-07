import requests
import sys
import platform
import time

import os


print("requests", requests)

print("sys.executable", sys.executable)


print("sys.version", sys.version)
print("sys.version_info", sys.version_info)
print("platform.python_version()", platform.python_version())
print("platform.python_version_tuple()", platform.python_version_tuple())

print('--------')
[print(x) for x in sys.path]
print('--------')

import hellolib

hellolib.run()



