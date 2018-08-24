#do binary search, recursive ly

class Bin
	def initialize(arr, key)
		@arr = arr
		@key = key
		recurs_find(@key,0, @arr.length-1)
	end
	def recurs_find(key, low, high)
		mid = (low + high)/2
		if key == @arr[mid]
			puts "we found the key! #{key}"	
		elsif low > high
			puts "we cannot find"
		else
			if key < @arr[mid]
				recurs_find(key, low, mid-1)
			else
				recurs_find(key, mid+1, high)
			end
		end
		
	end
end
