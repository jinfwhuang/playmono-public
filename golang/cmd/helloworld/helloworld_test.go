package main

import (
	"io/ioutil"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestHome(t *testing.T) {
	req := httptest.NewRequest("GET", "http://example.com/foo", nil)
	w := httptest.NewRecorder()
	home(w, req)

	resp := w.Result()
	if resp.StatusCode != 200 {
		t.Fatalf("Unexpected status code %d, expectted 200", resp.StatusCode)
	}
	body, _ := ioutil.ReadAll(resp.Body)
	if !strings.Contains(string(body), "Hello World") {
		t.Error("Unexpected content returned:", string(body))
	}
}
