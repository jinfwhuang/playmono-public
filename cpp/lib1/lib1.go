package lib1

// #cgo CXXFLAGS: -I/usr/lib/
// #cgo LDFLAGS: -L/usr/lib/ -lstdc++
// #cgo CFLAGS: -DFOO=1
// #cgo CXXFLAGS: -DCGO=1
// #include "lib_cgo.h"
import "C"
import "log"

func DoSomething() {
    log.Println("printing from go")
    log.Println("fff");

    C.add(1, 2)

    cs := C.CString("string from golang")
    C.saysomething1(cs)
    C.hello();

    C.saysomething1(C.CString("-----------------"))
    C.saysomething1(C.CString("|GO STRING|"))
    C.saysomething1(C.CString("-----------------"))
}