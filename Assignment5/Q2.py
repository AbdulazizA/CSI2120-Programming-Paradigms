#NOTE:
#the liters-per-100km are calculated by the following formula:
#liter(100km) = (100*3.785411784) / (1.609344*mpg)
#given the fact that U.S. Gallon = 3.785411784 Liters
#and Mile = 1.609344 Kilometers


fid = open("D:\imperial.txt", "r")
list2 = []

#splits the text file into separate lists
list = fid.read().split('\n')
for line in list:
    list2.append(line.split(','))

#extract the numbers from the mpg and cubic feet indexes
counter = lpk = cm = 0
mpg = cf = []
while (counter < len(list2)):
    mpg.append([int(c) for c in list2[counter][3].split() if c.isdigit()])
    cf.append([int(c) for c in list2[counter][4].split() if c.isdigit()])
    lpk = (100*3.785411784) / (1.609344*mpg[0][0])
    cm = 0.0283168*cf[0][0]
    list2[counter][3] = "{0:0.1f} litre/100 km".format(lpk)
    list2[counter][4] = "{0:0.3f} m^3".format(cm)
    mpg = cf = []
    counter+=1

#writing it out to a file
c = 0
fidw = open('D:\out.txt', 'w')
while (c < len(list2)):
    print ('{0},{1},{2}, {3}, {4}'.format(list2[c][0],list2[c][1],list2[c][2],list2[c][3],list2[c][4]), file = fidw)
    c+=1

fid.close()
fidw.close()
