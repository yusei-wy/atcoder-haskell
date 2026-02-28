package main

import (
	"fmt"
)

func main() {
	n := 4
	k := 43

	idx := 0
	age := n
	acc := 0

	for {
		acc += age

		if acc >= k {
			fmt.Println(idx)
			break
		}

		idx += 1
		age += 1
	}
}
