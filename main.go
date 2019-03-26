package main

import (
	"fmt"
	"log"
	"net/http"
	"net/url"
	"os"
	"strings"

	"github.com/gregjones/httpcache"
	"github.com/gregjones/httpcache/diskcache"
	"github.com/peterbourgon/diskv"

	"willnorris.com/go/imageproxy"
)

func main() {

	// Set server address
	addr := os.Getenv("ADDRESS")
	if addr == "" {
		log.Fatal("No address provided for the imageproxy")
	}

	// Set cache
	var cache httpcache.Cache
	d := diskv.New(diskv.Options{
		BasePath:     "/tmp/imageproxy",
		CacheSizeMax: 500 * 1024 * 1024,
		// For file "c0ffee", store file as "c0/ff/c0ffee"
		Transform: func(s string) []string { return []string{s[0:2], s[2:4]} },
	})
	cache = diskcache.NewWithDiskv(d)

	// Create proxy
	p := imageproxy.NewProxy(nil, cache)

	// Create whitelist
	if os.Getenv("WHITELIST") != "" {
		p.Referrers = strings.Split(os.Getenv("WHITELIST"), ",")
	}

	// Create baseurl
	if os.Getenv("BASEURL") != "" {
		base, err := url.Parse(os.Getenv("BASEURL"))
		if err != nil {
			log.Fatalf("error parsing baseURL: %v", err)
		}
		p.DefaultBaseURL = base
		p.AllowHosts = []string{base.Host}
	}

	p.ScaleUp = true

	server := &http.Server{
		Addr:    addr,
		Handler: p,
	}

	fmt.Printf("imageproxy listening on " + addr)
	err := server.ListenAndServe()
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
