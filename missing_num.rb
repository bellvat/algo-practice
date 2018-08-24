#find missing number in array
#using bit xor

def find_it(a)
	#iterate through a set of numbers
	#can't i just add one to the starting num?
	#
	len = a.length - 1
	first = a[0]
	missing_elem = 0
	(0..len).each do |num|
		if first != a[num] 
			missing_elem = a[num] - 1
			break
		end
		first += 1
	end
	return missing_elem
end
