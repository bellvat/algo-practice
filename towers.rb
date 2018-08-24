#towers of hanoi
#recursive
#
class Towers
	def initialize
		@disc = 3
		hanoi(@disc, 'a','b','c')
	end
	def hanoi(top, f, inter, t)
		if top == 1
			puts "Disk #{top} from #{f} to #{t}"
		else
			hanoi(top-1, f, t, inter)
			puts "Disk #{top} from #{f} to #{t}"
			hanoi(top-1, inter, f, t)
		end
	end

end
