package main

import (
	"fmt"
	"strconv"

	"github.com/morheus9/go_grpc/src/main/find_data"
)

func main() {

	var C = strconv.Itoa(find_data.Find_data())
	fmt.Println(C)
}
