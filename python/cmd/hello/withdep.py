

import requests
import sys
import platform


print("main")


print("requests", requests)

print("sys.executable", sys.executable)


print("sys.version", sys.version)
print("sys.version_info", sys.version_info)
print("platform.python_version()", platform.python_version())
print("platform.python_version_tuple()", platform.python_version_tuple())



import time

print("Sleeping ....")
time.sleep(100000)

