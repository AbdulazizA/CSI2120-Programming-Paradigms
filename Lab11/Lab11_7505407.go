func main() {

	src := sendInt()
	time.Sleep(time.Second)
	dst := filterInt(src)
	time.Sleep(time.Second)
	for i := range dst {
		time.Sleep(time.Second)
		fmt.Printf("%d ", i)
		fmt.Println()
	}

}