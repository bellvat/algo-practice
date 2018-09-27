#rotate array, given an array and how many to rotate, rotate it.
#use temp array? and shift the rest

def rot(arr,n)
	#first, lets assume that n will be less than or equal to the length of the array
	#will be the first n elements
	# in the case that n is greater
	nu = arr.length - (n % arr.length)
	temp = arr[0...(nu)]
	p temp
	t = nu
	j = nu
	#shift the rest up
	(0...arr.length).each do |i|
		arr[i] = arr[t]
		t += 1
		p " first #{arr}"
	end
	nu.times do |i|
		arr[(arr.length-1) - (j-1)] = temp[i]
		j -= 1
		p " second #{arr}"
	end
	p arr
end

rot([1,2,3,4,5],2)
