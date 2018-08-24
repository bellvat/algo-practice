#insertion sort, but remove dups as we go along, we should not be moving items more than once
#
def insertion_sort(a)
	len = a.length - 1
	for i in 1..len
		j=i
		while j > 0
			if a[j-1]>a[j]
				temp = a[j]
				a[j] = a[j-1]
				a[j-1] = temp
			elsif a[j-1]==a[j]
				a[j]
			else
				break
			end
			j = j-1
		end
	end
	return a
end

def no_dups
end

def test(a)
    for i in 1...(a.length)
        j=i
        while j>0
            if a[j-1]>a[j]
                temp=a[j]
                a[j]=a[j-1]
                a[j-1]=temp
            else
              break
            end
            j=j-1
        end
    end
    return a
end
