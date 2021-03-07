import os
import sys

print('python is', sys.version_info)

print('--------')
[print(x) for x in sys.path]
print('--------')


import pybind_module1
print("pybind_module1", pybind_module1)
print("pybind_module1.add", pybind_module1.add(5, 6))

pybind_module1.saysomething("-----------------")
pybind_module1.saysomething("|PYTHON STRING|")
pybind_module1.saysomething("-----------------")
