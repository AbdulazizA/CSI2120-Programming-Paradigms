def cubeLess(x,y):
    return y-x**3

def smallerCube(z):
    tup = ()
    list = []
    counter = 1
    while(counter**3 <= z):
        tup = (counter, cubeLess(counter,z))
        list.append(tup)
        counter+=1

    return list

def restSum(list):
    total = 0
    for tup in list:
        total+=tup[1]
    return total

def showAllRestSum(a,b):
    resultList=[]
    num = a
    while (num <= b):
        result=restSum(smallerCube(num))
        if (result % 3 == 0):
            resultList.append((num,result))
        num+=1
    print (resultList)
        
    
