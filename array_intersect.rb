#find where the two arrays intersect
#use sorting?
def intersect(nums1, nums2)
	#sort nums1
	arr = []
	if nums1.empty? || nums2.empty?
		return []
	else
		nums1.sort!
		nums2.sort!
		#Now that it is sorted, I can find where they intersect by iterating through it once
		nl1 = nums1.length
		nl2 = nums2.length
		j = 0
		k = 0
		p nums1
		p nums2
		#this was where it wasn't working. the while..if i got that, i would have been able to solve it!!
		while j<nl1 && k<nl2
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
		end
	end
	p arr
	
end

intersect([1,1],[1])
			p arr
			p "j #{j}"
			p "k #{k}"
