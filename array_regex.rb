#create pattern matching wildcards
#return the true if match, false if don't match, for * and ?
#? means matches 0 or 1
#* means matches 0 or more of the preceding character
#

def match(s,p) 
	#pat = pattern, like ea*t
	#word is like eat, so in this case, true for * and ?
	#however, word is eaat, it will be false for ?, and true for *
	i = 0
	j = 0
	starInd = -1
	iInd = -1

	while (i < s.size)
		if j < p.size && (p[j] == '?' || p[j] == s[i])
			i += 1
			j += 1
		elsif j < p.size && p[j] == '*'
			starInd = j
			iInd = i
			j += 1
		elsif starInd != -1
			j = starInd + 1
			i = iInd + 1
			iInd += 1
		else
			return false
		end
	end
	while j < p.size && p[j] == '*'
		j += 1
	end
	return j == p.size
end

match('aab','*ab')
