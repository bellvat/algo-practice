#sorted array
#go through array, have a low and high, and there is a mid as well?
def search(a, target)
	lo = 0
	#[ . . . ] length will give me 4, but finding it using arrary[] will need to be 3
	hi = a.length - 1
	#do we want to start in the middle? yes, then see if the key is lower or higher then the middle, and the middle either becomes the new lo or high
	while  lo <= hi #move through the array??? 
		mid = lo + ((hi - lo)/2)
		if target == a[mid]
			return a[mid]	
		elsif target > a[mid]
			lo = mid + 1
		else
			hi = mid - 1
		end
		puts "lo is #{lo}, high #{hi}"
	end
end
