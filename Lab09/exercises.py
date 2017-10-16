#Printing:
#Pass it as a tuple:
print("Total score for %s is %s  " % (name, score))
#Or use the new-style string formatting:
print("Total score for {} is {}".format(name, score))
#Or pass the values as parameters and print will do it:
print("Total score for", name, "is", score)
#If you don't want spaces to be inserted automatically by print, change the sep parameter:
print("Total score for ", name, " is ", score, sep='')



print( '{} {}!'.format('Hello', 'World')
print( '{0} {1}!'.format('Hello', 'World')
print( '{hello} {world}!'.format(hello='Hello', world='World')

print( '{0} {1:#04x} {2}'.format(126, 126, chr(126))

for i in range(0,255):
    print('{a:3d} {b:#04x} {c}'.format(a=i, b=i, c=chr(i)))
print('{0}'.format('\n'.join('{a:3d} {b:#04x} {c}'.format(a=i, b=i, c=chr(i)) for i in range(255))))

print('{0}'.format(''.join('{a:3d} {b:#04x} {c}\n'.format(a=i, b=i, c=chr(i)) for i in range(255))))



#Question 2
import random
import math

things=5*['car'] + 3*['bike'] + 4*['airplane']
ids = [math.trunc(100*random.random()) for x in range(len(things))]

#define a sort function
def sortIndex(item):
    return item[index]
	
	#fix the line below to sort according to pass 1 for radix sort
	index = 0
	tups = sorted([(ids[i], things[i]) for i in range(len(things))], key=sortIndex)
	print(tups)
	print('\n')
	
	#add sorting for pass 2 of radix sort
	index = 1
	tups.sort(key=sortIndex)
	print(tups)