package main

import (
	"flag"
	"fmt"
	"io"
	"log"
	"net/http"

	"github.com/jinfwhuang/playmono/pkg/utils"
)

func init() {
	log.SetFlags(log.LstdFlags | log.Lshortfile)

	// Use a lib
	log.Println(utils.RandStr(37))
}

func main() {
	flag.Parse()
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		io.WriteString(w, "Hi!\n")
	})
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "ok\n")
	})

	const addr = ":8080"
	log.Println("server running at: ", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
