#find the the closest sum of the 3 numbers to the key/target, in an array

def find_closest_sum(key, arr)
	#use 2 pointers, plus one loop
	len = arr.length - 1
	arr = arr.sort
	result = 0
	(0..len).each do |i|
		j = i + 1
		k = len
		#set min or is it max, equal to a very high num
		min = 1000
		while j<k
			sum = arr[i] + arr[j] + arr[k]
			diff = (sum - key).abs
			#if exact
			if sum == key
				p sum
			end
			#keeping track of the least difference using 'min' variable
			if diff < min
				#new min is set to the difference, the min value will be tracked here
				min = diff
				result = sum
			end
			if sum < key
				k -= 1
			elsif sum > key
				j += 1
			end
		end
	p result
	end

end

find_closest_sum(-1, [-1, 2, 1, -4])
