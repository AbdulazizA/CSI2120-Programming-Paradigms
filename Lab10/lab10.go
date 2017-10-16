//2

package main

import "fmt"

func main() {
	lineWidth := 5
	symb := "x"
	lineSymb := symb
	formatStr := fmt.Sprintf("%%%d\n", lineWidth)
	for ; len(lineSymb) < lineWidth; lineSymb += symb {
		fmt.Printf(formatStr, lineSymb)
	}
	for ; len(lineSymb) > 0; lineSymb = lineSymb[:len(lineSymb)-1]{
	fmt.Printf(formatStr, lineSymb)
	}}


//3
package main

import (
	"fmt"
	"strings"
)

func main() {
	
	var cntA, cntE, cntI, cntO, cntU int
	for _, charVal := range text{
		switch{
			case charVal == 'a' || charVal == 'A':
			  cntA++
			case charVal == 'e' || charVal == 'E':
			  cntE++
			case charVal == 'i' || charVal == 'I':
			  cntI++
			case charVal == 'o' || charVal == 'O':
			  cntO++
			case charVal == 'u' || charVal == 'U':
			  cntU++
		}
	
	fmt.Printf("a/e/i/o/u:  %d/%d/%d/%d\n", cntA, cntE, cntI, cntO, cntU)
	}

//4

func inPerson(p *Person, lastId int) (nextId int, err error){
	nextId = lastId
	//Enter last name
	fmt.Print("Last Name: ")
	_, err = fmt.Scanf("%s", &p.lastName)
	if err != nil {
		return
	}
	//Enter first name
	fmt.Print("First Name: ")
	_, err = fmt.Scanf("%s", &p.firstName)
	if err != nil {
		return
	}
	//generate ID
	nextId += 1
	p.iD = nextId
	return
	
}

func printPerson (p Person) {
	//
	fmt.Printf("%10.d\t%s\t%s\n", p.iD, p.firstName, p.lastName)
	}
	
	func main() {
		nextId := 101
		for {
			var (
				p Person
				err error
			)
			nextId, err = inPerson(&p, nextId)
			if err != nil {
				fmt.Println("Invalid entry...exiting")
				break
				}
				printPerson(p)
			}
		}
