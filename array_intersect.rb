#find where the two arrays intersect
#use sorting?
def intersect(nums1, nums2)
	#sort nums1
	nums1.sort!
	nums2.sort!
	#Now that it is sorted, I can find where they intersect by iterating through it once
	nl1 = nums1.length
	nl2 = nums2.length
	ml = [nl1,nl2].max
	arr = []
	j = 0
	k = 0
	p nums1
	p nums2
	(0...ml).each do |i|
		#var j,k
		if nums1[j] == nums2[k]
			arr << nums1[j]
			j += 1
			k += 1
		elsif nums1[j] < nums2[k]
			j += 1
		else
			k += 1
		end
		p arr
	end
	return arr
	
end

p intersect([1,2,2,1],[2,2])
