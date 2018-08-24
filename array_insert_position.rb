#given sorted array, find where target will be inserted, or if cannot find, return the position where it will be inserted

def search_pos(arr, target)
	l = 0
	r = arr.length - 1
	while l <= r
		m = (r+l)/2
		if arr[m] < target
			l = m + 1
		elsif arr[m] > target
			r = m-1
		else
			return m
		end
	end

end

puts search_pos([2,3,4,5], 4)
