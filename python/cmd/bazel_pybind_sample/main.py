import os
import sys

print('python is', sys.version_info)

print('--------')
[print(x) for x in sys.path]
print('--------')



import my_pb_mod
print("my_pb_mod", my_pb_mod)

print("using cpp add", my_pb_mod.add(1, 2))

import pybind_module1
print("pybind_module1", pybind_module1)

print("pybind_module1.add", pybind_module1.add(5, 6))


pybind_module1.saysomething("-----------------")
pybind_module1.saysomething("hello 1")
pybind_module1.saysomething("hello 2")
pybind_module1.saysomething("hello 3")
pybind_module1.saysomething("-----------------")
