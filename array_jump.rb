class Solution
	def can_jump(position, arr_num)
		if position == arr_num.length - 1
			return true
		end
		furthest_jump = [position + arr_num[position], arr_num.length - 1].min
	end
end
