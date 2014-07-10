package main

import "fmt"
import "github.com/user/newmath"
import "github.com/ccding/go-logging/logging"

func main() {
	fmt.Printf("hello, world Sqrt(2) = %v\n", newmath.Sqrt(2))
	logger, _ := logging.SimpleLogger("main")
	logger.Error("this is a test from error")
	logger.Destroy()
}
