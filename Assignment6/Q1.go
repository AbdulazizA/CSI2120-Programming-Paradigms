package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

type roomSz struct {
	width  float32
	length float32
}
type House struct {
	rooms  []string
	name   string
	sizeFt []roomSz
}

type Home interface {
	inputSqft()
	printMetric()
}

type Semi struct {
	House
}

func NewHouse() *House {
	House := House{
		name:   "House",
		rooms:  []string{"kitchen", "living", "dining", "main"},
		sizeFt: make([]roomSz, 4),
	}

	return &House
}

func NewHouseRooms(newRooms []string) *House {
	NewHouseR := new(House)
	(*NewHouseR).name = "NewRooms"
	for i := 0; i < len(newRooms); i++ {
		(*NewHouseR).rooms = append((*NewHouseR).rooms, newRooms[i])
	}

	(*NewHouseR).sizeFt = make([]roomSz, len(newRooms))

	return NewHouseR
}

func NewSemi() *House {
	House := House{
		name:   "Semi",
		rooms:  []string{"kitchen", "living", "dining", "main"},
		sizeFt: make([]roomSz, 4),
	}

	return &House
}

func NewSemiRooms(newRooms []string) *House {
	NewHouseR := new(House)
	(*NewHouseR).name = "Semi"
	for i := 0; i < len(newRooms); i++ {
		(*NewHouseR).rooms = append((*NewHouseR).rooms, newRooms[i])
	}

	(*NewHouseR).sizeFt = make([]roomSz, len(newRooms))

	return NewHouseR
}

func (house *House) inputSqft() {
	var float1 float32
	var float2 float32
	reader := bufio.NewReader(os.Stdin)
	for i := 0; i < len((*house).rooms); i++ {

		fmt.Print((*house).rooms[i], ": width x length: ")
		inStr, _ := reader.ReadString('\n')
		result := strings.Split(strings.TrimSpace(inStr), "x")
		string1, _ := strconv.ParseFloat(result[0], 32)
		string2, _ := strconv.ParseFloat(result[1], 32)
		float1 = float32(string1)
		float2 = float32(string2)
		roomSize := roomSz{float1, float2}
		(*house).sizeFt[i] = roomSize

	}

}

func (house *Semi) inputSqft() {
	var float1 float32
	var float2 float32
	reader := bufio.NewReader(os.Stdin)
	for i := 0; i < len((*house).rooms); i++ {

		fmt.Print((*house).rooms[i], ": width x length: ")
		inStr, _ := reader.ReadString('\n')
		result := strings.Split(strings.TrimSpace(inStr), "x")
		string1, _ := strconv.ParseFloat(result[0], 32)
		string2, _ := strconv.ParseFloat(result[1], 32)
		float1 = float32(string1)
		float2 = float32(string2)
		roomSize := roomSz{float1, float2}
		(*house).sizeFt[i] = roomSize

	}

}

func (house *House) printMetric() {
	fmt.Println((*house).name)
	for i := 0; i < len((*house).sizeFt); i++ {
		toMeter1 := (*house).sizeFt[i].width * 0.3048
		toMeter2 := (*house).sizeFt[i].length * 0.3048

		fmt.Print((*house).rooms[i], ": ")
		fmt.Printf("%.2f", toMeter1)
		fmt.Printf("x")
		fmt.Printf("%.2f", toMeter2)
		fmt.Printf("\n")

	}

}

func (house *Semi) printMetric() {
	fmt.Println((*house).name)
	for i := 0; i < len((*house).sizeFt); i++ {
		toMeter1 := (*house).sizeFt[i].width * 0.3048
		toMeter2 := (*house).sizeFt[i].length * 0.3048

		fmt.Print((*house).rooms[i], ": ")
		fmt.Printf("%.2f", toMeter1)
		fmt.Printf("x")
		fmt.Printf("%.2f", toMeter2)
		fmt.Printf("\n")

	}

}

func main() {
	homes := []Home{NewHouse(), NewSemi(), NewHouseRooms([]string{"bedroom1", "bedroom2"})}

	for i := 0; i < len(homes); i++ {
		homes[i].inputSqft()
		homes[i].printMetric()
	}
}
