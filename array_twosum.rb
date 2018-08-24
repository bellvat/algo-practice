#find 2 indices that add up to a target number

def two_sum(targ, arr)
	#2 pointers? and then keep track of the sum
	len = arr.length - 1
	(0..(len-1)).each do |j|
		(1..len).each do |i|
			if arr[j] + arr[i] == targ
				p j,i
			end
		end
	end

end


def two_sum1(key, arr)
	len = arr.length - 1
	hasht = {}
	(0..len).each do |i|
		if hasht[arr[i]] == nil
			hasht[key-arr[i]]  = i
		else
			p i
			p hasht[arr[i]]
		end
		p hasht		
	end

end

two_sum1(9,[1,2,3,6])
two_sum1(9,[3,2,3,6])
