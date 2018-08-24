#insert position of target, or position of target itself. find
#redo of this algo

def search_pos(arr, targ)
	l = 0
	r = arr.length - 1 
	while l < r
		med = (l+r)/2
		if targ > arr[med]
			l = med + 1
		elsif targ < arr[med]
			r = med - 1
		else
			puts med
			return
		end
	end
	puts l
end

search_pos([3,4,5,7,8],6)
