string=input("Please enter a string: ")
u = 0
for word in string.split():
    uppers=[l for l in word if l.isupper()]
    u += len(uppers)

w = len(string) - sum(c.isspace() for c in string)
    
print("Upper {} \nNon-whitespace {}".format(u, w))
    
