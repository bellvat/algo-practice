#given unsorted array, find longest consecutive sequence
#cannot sort, must do in 0n time
#hash table, insert before and after?
#then how to determine it is consecutive..must be difference of positive one?
#

def longest_seq(arr)
	hash1 = {}
	count = 0
	(0...arr.length).each do |i|
		hash1[i] = arr[i]
	end
	hash = hash1.dup
	hash1.each_key do |i|
		p hash1
		p i
		left = hash1[i] - 1
		right = hash1[i] + 1
		count = 1
		while hash.has_value?(left)
			count += 1
			hash.delete(left)
			left -= 1
			#remove element
		end
		while hash.has_value?(right)
			count += 1
			#remove element
			hash.delete(right)
			right += 1
		end
	end
	puts count
end

longest_seq([3,4,5,10,11,12,13])
