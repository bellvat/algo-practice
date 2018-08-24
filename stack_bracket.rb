#using stacks to determine if a bracket is matched
#i can use push and pop methods in an array to mimic stack behavior

def bracket(s)
	arr_s = s.chars
	brack_arr = []
	arr_s.each do |w|
		if w == "("
			brack_arr << w 
		end
		p brack_arr
		if w == ")"
			last = brack_arr.pop
			if last != "(" && w == ")"
				p "error!"
			end
		end
	end
	if !brack_arr.empty?
		p "error!!"
	end
	
end
