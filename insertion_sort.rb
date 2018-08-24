#This comparing the right to the left, then swapping left
#as oopposed to bubble sort, which we start with the left -> right. then swap right
def insertion(a)
	len = a.length	
	for i in 0..(len-1) #going through each element
		for j in i..0 #elements go from right to left <-
			if a[j-1] > a[j]
				temp = a[j-1]
				a[j - 1] = a[j]
				a[j] = temp
			end
		end
	end
	return a

end
