#odd even sort, sort even, then odd, until all numbers are sorted
#how would we know when all numbers are sorted?
#
def odd_even(a)
	len = a.length - 1
	is_sorted = 0
	while is_sorted == 0
		is_sorted = 1
	(0..len).step(2) do |j|
		if (j+1) <= len 
			if a[j] > a[j+1]
				temp = a[j]
				a[j] = a[j+1]
				a[j+1] = temp
				is_sorted = 0
			end
		end
	p a,j, "even", "sorted?", is_sorted
	end
	(1..len).step(2) do |j|
		if (j+1) <= len 
			if a[j] > a[j+1]
				temp = a[j]
				a[j] = a[j+1]
				a[j+1] = temp
				is_sorted = 0
			end
		end
	p a,j,"odd"
	end
	end
	return a

end
