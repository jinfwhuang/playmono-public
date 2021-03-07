package main

import (
	"log"
	// "github.com/jinfwhuang/playmono/pkg/utils"
	"github.com/jinfwhuang/playmono/cpp/lib1"
)

func main() {
    log.Println("printing from go")
    log.Println("fff");

    lib1.DoSomething()
}