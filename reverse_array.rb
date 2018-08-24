#reverse array 0(1)

def reverse(a)
	len = a.length - 1
	for i in 0..(len/2)
		j = len - i
		a[i],a[j] = a[j],a[i]
	end
	return a
end
