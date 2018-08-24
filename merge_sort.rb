#this splits the array in 2, sorts the right, sorts the left, then merges the 2, then does it recursively
#there should be a method for sorting, and a method for merging, and one that combines all of them
def merge_sort(a,l,m,r)
	#count arrays
	count_arr_l = m-l+1 
	count_arr_r = r-m 
	#make temp arrays, empty
	left = Array.new(count_arr_l)
	right = Array.new(count_arr_r)
	#add elements to empty array
	for i in 0..count_arr_l
		left[i] = a[l + i] #l moves right because i gets bigger
	end
	for j in 0..count_arr_r
		right[j] = a[m + 1 + j] #middle plus one gives us the right element from the middle, then increment to the right by adding j
	end
	
	i=0
	j=0
	
	for k in 0..(a.length - 1)
		if i >= count_arr_l
			a[k] = right[i]
			i += 1
		elsif j >= count_arr_j
			a[k] = left[j]
			j += 1
		elsif left[i] > right[j]
			a[k] = right[j]
			j += 1
		else
			a[k] = left[i]
			i += 1
		end
	end
end

def together(a,l,r)
	if l<r #not sure why this is********
		m = l + (r-l)/2
		together(a,l,m)
		together(a,m + 1, r)
		merge_sort(a,l,m,r)
	end
end






#since we're doing merge sort, we don't need bubble sort..hellooo
