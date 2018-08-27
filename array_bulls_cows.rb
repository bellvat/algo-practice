#guessing game, parameter is guessing the number, then we have to output how many bulls, and how many cows
#bulls are where the position and number is right, cows are where the number is right

#** Alternative solutions, compare element at indices of targ_num and num
# Test for bull, if equal, then bull, if not, put in hashmap: the Element if key, and frequency is value, and increment frequency
# Then test for cow: element at indices != to each other, if hash map contains the key then cow, if the frequency was one, then remove the key, if the frequency was more than one, decrement the frequency 
def bulls_cows(targ_num, num)
	#num to array
	#hash table?
	targ_arr = targ_num.to_s.chars
	num_arr = num.to_s.chars

	hash = {}
	bull = 0
	cow = 0
	targ_arr.each_with_index do |i,ind|
		hash[i] ||= []
		hash[i] <<  ind
	end
	num_arr.each_with_index do |j,ind|
		if !hash[j].nil? && hash[j].include?(ind)	
			hash[j].delete(ind)
			bull += 1
		elsif !hash[j].nil?
			cow += 1
		end
	end
	p bull, "bulls"
	p cow, "cows"
	p hash
end

bulls_cows(1645, 12641)

