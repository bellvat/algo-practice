#converting string to integer....if string is not num, it is 0
#THERE ARE OTHER CASES I MAY BE IGNORING, LIKE NONE, OR SYMBOLS?also havent printed answer
def strtoa(str)
	arr = str.chars
	#i would loop through the array, and check each one if its number..lol
	#and then build
	result = 0
	#this checks if element within 0 and 9 AND that i is less than than the length, using while is good because it will terminate at the point where the element is letter, which is what we want
	while i<arr.length && arr[i]>=0 && arr[i]<=9
		result = result*10 + arr[i]
		i += 1
	end

end
