#find the number that occurs more than n/2 times
#store in a hash table? yes

def majority(arr)
	tab = {}
	n = arr.length
	max = 1
	(0...n).each do |i|
		tab[arr[i]] ||= 0
		tab[arr[i]] += 1
		if tab[arr[i]] > max && tab[arr[i]] > (n/2)
			max = arr[i]
		end
		p tab
	end
	if max > 1	
		return max
	else
		return 0
	end
end

p majority([2,2,2,1,1,1])
