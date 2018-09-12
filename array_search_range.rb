#find the range of target values
#in O(n) time, lets try to write a recursive binary search

def final(arr,key)
	right = arr.length-1
	left = 0

	result = Array.new(2)
	result[0] = -1
	result[1] = -1

	search_range(arr,key,right,left,result)
	p result
end
def search_range(arr, key, right,left,result) 
	if left>right
		return
	end

	#m = (right+left)/2
	m = left + (right-left)/2
	#above is another way to find mid, or the more correct way?
	if key < arr[m]
		search_range(arr, key, m-1,left) 
	elsif key > arr[m]
		search_range(arr, key, right,m+1) 
	else
		result[0] = m
		result[1] = m
		t1 = m
		#for left
		while t1 > left && arr[t1] == arr[t1-1]
			t1 -= 1
			#why would this be last?, wouldn't i want to add it first, then decrement?
			result[0] = t1
		end
		t2 = m
		while t2<right && arr[t2] == arr[t2+1]
			t2 += 1
			result[1] = t2
		end
		return
	end
end

final([1,2,2,4], 2)
