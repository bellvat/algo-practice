#selection sort goes through the array, finding the lowest one, and putting it in the front [- - - - -], then [- - - -], then [- - -], incrementing the starting index by one

def selection(a)
	len = a.length - 1
	for i in 0..len
		for j in (i+1)..len #just a tracker, for comparison
			if a[i]>a[j] #if compared, and there are smaller elements, move it to the front <- a[j]
				temp = a[i]
				a[i] = a[j]
				a[j] = temp
			end
		end
	end
	return a
end
