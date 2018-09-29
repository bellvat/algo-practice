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
		ml = [nl1,nl2].max
		j = 0
		k = 0
		p nums1
		p nums2
		while j != nl1-1 && k != nl2-1
			#var j,k
			if nums1[j] == nums2[k]
				arr << nums1[j]
				if j < nl1-1 
					j += 1
				end
				if k < nl2-1
					k += 1
				end
			elsif nums1[j] < nums2[k]
				if j < nl1-1
					j += 1
				end
			else
				if k < nl2-1
					k += 1
				end
			end
		end
	end
	p arr
	
end

intersect([1,1],[1])
			p arr
			p "j #{j}"
			p "k #{k}"
