class House:
    rooms = []
    sqftList=[]
    hstring = "House"
    
    def __init__(self, rooms=['kitchen', 'living', 'dinning', 'main' ]):
        self.rooms= ['kitchen', 'living', 'dinning', 'main']
        if rooms != self.rooms:
            for room in rooms:
                self.rooms.append(room)
                
                
    def inputSqft(self):
        
        counter = 0
        while(counter < len(self.rooms)):
            response=input("{0} :  width x length: ".format(self.rooms[counter]))
            self.sqftList.append(response)
            counter+=1
            
    def printMetric(self):
        metList=[]
        counter2 = 0
        for sqft in self.sqftList:
            metList.append(sqft.split('x'))
       
        
        while(counter2 < len(metList)):
            metList[counter2][0] = float(metList[counter2][0]) * 0.3048
            metList[counter2][1] = float(metList[counter2][1]) * 0.3048
            counter2+=1
            
    
        print(self.hstring)
        counter = 0
        while(counter < len(self.rooms)):
            print("{0} : {1:.2f} x {2:.2f} m".format(self.rooms[counter], metList[counter][0], metList[counter][1]))
            counter+=1
            
class Semi(House):
    rooms=[]
    hstring="Semi"
    def __init__(self, rooms=['kitchen', 'living', 'dinning', 'main' ]):
        super.__init__(rooms=['kitchen', 'living', 'dinning', 'main' ])