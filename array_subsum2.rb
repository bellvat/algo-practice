#recoding finding number of sub array whos sum is closest to given number

def subsum(arr,num)
	j=0
	i=0
	sum = 0
	minLen = 0
	while j < arr.length
		if sum < num
			sum += arr[j]
			j += 1
		else
			minLen = [9000,j-i].min
			#if contains the exact number
			if i == (j-1)
				return 1
			end
			sum -= arr[i]
			i += 1
		end
	end
	while sum >= num
		minLen = [9000,j-i].min
		#here, why are we incrementing the i before?
		i += 1
		sum -= arr[i]
	end
	if minLen == 9000
		puts 0
	else
		puts minLen
	end
end

subsum([1,2,2,3,5],3)
