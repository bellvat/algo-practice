#find the kth element in the sorted array, doensn't have to be distinct
#example, find the 3rd largest elment in this array [2,3,4,4,5,5,6], the answer would be 5
#what are they doing when selecting the k?
def find_k(k,arr)
	#need to sort the array
	#then can do negative index to find it
	#we can use quicksort
	driver(lt,rt)
	#its sorted
	#then find the kth element, easy
	k = k * -1
	arr[k]
end

def driver(lt,rt)
	if lt > rt
		puts arr
	else
		pivot = arr[rt]
		partition = partition(lt,rt,pivot)
		driver(lt, partition - 1)
		driver(partition + 1, rt)
	end
end

def partition(lt,rt,pivot)
	l = lt
	r = rt
	while true
		while l < pivot
			if arr[l] > arr[pivot]
				break
			else
				l += 1
			end
		end
		while r > pivot
			if arr[r] < arr[pivot]
				break
			else
				r -= 1
			end
		end
		
		if l > r
			temp = arr[l]
			arr[l] = arr[r]
			arr[r] = temp
		end
		return l 
	end
end
