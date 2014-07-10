package main

import "fmt"
import "github.com/ccding/go-logging/logging"

func main() {
	fmt.Printf("hello, world")
	logger, _ := logging.SimpleLogger("main")
	logger.Error("this is a test from error")
	logger.Destroy()
}
