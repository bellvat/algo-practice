#find the minimal length of sub arrays where the sum is greater than or equal to a given integer
#given [2,3,4], and num = 7, sub array [3,4] will satisfy that condition, and the answer is 2, if none is found, return 0
#
def subarray(arr,num)
	#sort the array, use pointers
	j = 0
	i = 0
	sum = 0
	while j < arr.length
		if sum < num
			#moving up the array if sum is less than number
			sum += arr[j]
			j += 1
		else
			minLen = [9000, j-i].min
			if i == (j-1)
				return 1
			end
			sum -= arr[i]
			i += 1
		end
		puts sum, "first"
		puts minLen, "minfirst"
		puts i,"i", j, "j"
	end
	
	while sum >= num
		minLen = [9000, j-i].min
		i += 1
		sum -= arr[i]
		puts sum, "second"
		puts minLen, "minsecond"
		puts i,"i", j, "j"
	end
	if minLen == 9000
		puts 0
	else
		puts minLen
	end

end
subarray([2,3,4,5],8)
