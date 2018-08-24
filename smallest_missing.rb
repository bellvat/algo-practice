#given an array of sorted num, find the smallest missing

def search_small(arr)
	lo = 0
	current = arr[lo]
	final = arr.length - 1 

	while lo <= final 
		if arr[lo] != current
			return current 
		else
			lo += 1
			current += 1
		end
		p "lo #{lo} and current #{current}"
	end
end
