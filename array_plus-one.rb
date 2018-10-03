#add one to the array of digits
#[1,2,3] becomes [1,2,4], and [1,2,9] becomes [1,3,0]
#
def plus(digits)
	#i would have to start adding from the last element
	#if it equals 10, i have to add one to previous element
	#if one doesn't exist, then i have to create space for that extra digit
	#i can create a new array? use pointers? i don't need a stack
	#start from the last and count down, set a flag?
	#recursively? if 10 then +1, or translate into string, then number, then back to array
	n = digits.length - 1
	add = true
	(n).downto(0) do |i|
		if add == true
			if i == 0 && (digits[i] + 1) > 9
				digits[i] = 0 
				digits.unshift(1)
			elsif (digits[i] + 1) > 9
				digits[i] = 0 
				add = true
			else
				digits[i] = (digits[i] + 1)
				add = false
			end
		end
	end
	return digits
end
plus([9])
