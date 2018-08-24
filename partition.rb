#class
#
class Partition
	def initialize(array)
		@arr = array
		driver(0, @arr.length-1)
	end

	def driver(left, right)
		if left > right
			puts @arr
		else
			pivot = @arr[right]
			partition = part(left,right,pivot)
			driver(left, partition - 1)
			driver(partition + 1, right)
		end
	end

	def part(lt, rt, pivot)
	#i want to set a pivot, and move every lower to the left, and everything higher to the right	
		ltPtr = lt 
		rtPtr = rt
		#while left pointer is pointing at element less than pivot, move on
		while true
			while @arr[ltPtr] < pivot
				ltPtr += 1
			end
			while @arr[rtPtr] > pivot
				rtPtr -= 1
			end
			if ltPtr >= rtPtr
				break
			else
				temp = @arr[ltPtr]
				@arr[ltPtr] = @arr[rtPtr]
				@arr[rtPtr] = temp
			end
		end
			p ltPtr
	end

end
