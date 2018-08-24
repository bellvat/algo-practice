#swap characters until array is sorted
def bubble(a)
	len = a.length - 1
	(0..(len)).each do |i|
		(0..(len - 1)).each do |j|
			p "this is i #{i} and this is j #{j}"
			p "showing length #{len - 1}"
			p a
			if a[j] > a[j+1]
				temp = a[j]
				a[j] = a[j+1]
				a[j+1] = temp
			end
		end
	end
	return a
end
