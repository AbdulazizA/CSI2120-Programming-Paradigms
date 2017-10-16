package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"time"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	f1, err := ioutil.ReadFile("D:/input1.txt")
	f2, err2 := ioutil.ReadFile("D:/input2.txt")

	check(err)
	check(err2)

	result1 := strings.Split(string(f1), " ")
	result2 := strings.Split(string(f2), " ")

	ch1 := input1(result1)
	ch2 := input2(result2)
	ch3 := newLine("\r\n")

	f, err := os.Create("D:/output.txt")

	defer f.Close()

Forever:
	for {
		select {
		case str1, ok := <-ch1:

			if !ok {
				break Forever
			}
			f.WriteString(str1 + " ")
			fmt.Print(str1 + " ")
		case str2, ok := <-ch2:

			if !ok {
				break Forever
			}
			f.WriteString(str2 + " ")
			fmt.Print(str2 + " ")

		case newline, ok := <-ch3:
			if !ok {
				break Forever
			}
			f.WriteString(newline)
			fmt.Print(newline)

		}
	}
}

func input1(result1 []string) chan string {
	ch1 := make(chan string)
	go func() {
		for _, x := range result1 {
			ch1 <- x
			time.Sleep(time.Millisecond * 200)
		}
		close(ch1)
	}()
	return ch1
}

func input2(result2 []string) chan string {
	ch2 := make(chan string)
	go func() {
		for _, x := range result2 {
			ch2 <- x
			time.Sleep(time.Millisecond * 300)
		}
		close(ch2)
	}()
	return ch2
}

func newLine(newline string) chan string {
	ch3 := make(chan string)
	timer := time.NewTimer(time.Second * 2)
	go func() {
		for x := 0; x < 5; x++ {
			<-timer.C
			ch3 <- newline
			timer.Reset(time.Second * 2)
		}
		close(ch3)
	}()
	return ch3
}
