#validate sudoku board, rows and columns must be 1-9, and each 3x3 subbox must also be 1-9
#can use hash to store values
#much like detecting duplicates.
#for each row, i can make a hash?
#or make a ready made hash, and then subtract values. if hash is 0, it means that that number is already taken.
#that means I would have to make 18 hashes for each row and column, and then +9 3x3 boxes, so 27 hashes
#lets solve it the naiive way first, and then look for refactor options
#NEED TO REFACTOR!
#things to remember: the input is a string....... == vs = ......
def is_valid_sudoku(board)
	hash = {}
	(1..9).each do |i|
		hash["#{i}"] = 1
	end
	puts hash
	#dup the hash per time i we do go through the loop
	(0...9).each do |r|
		hash1 = hash.dup
		(0...9).each do |c|
			#go through each row
			next if board[r][c] == '.'
			if hash1[board[r][c]] != nil
				if hash1[board[r][c]] == 1
					hash1[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	(0...9).each do |c|
		hash13 = hash.dup
		(0...9).each do |r|
			#go through each column
			next if board[r][c] == '.'
			if hash13[board[r][c]] != nil
				if hash13[board[r][c]] == 1
					hash13[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end

	hash2 = hash.dup
	(0...3).each do |r|
		(0...3).each do |c|
			next if board[r][c] == '.'
			if hash2[board[r][c]] != nil
				if hash2[board[r][c]] == 1
					puts "here"
					hash2[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash3 = hash.dup
	(3...6).each do |r|
		(0...3).each do |c|
			next if board[r][c] == '.'
			if hash3[board[r][c]] != nil
				if hash3[board[r][c]] == 1
					hash3[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash4 = hash.dup
	(6...9).each do |r|
		(0...3).each do |c|
			next if board[r][c] == '.'
			if hash4[board[r][c]] != nil
				if hash4[board[r][c]] == 1
					hash4[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash5 = hash.dup
	(0...3).each do |r|
		(3...6).each do |c|
			next if board[r][c] == '.'
			if hash5[board[r][c]] != nil
				if hash5[board[r][c]] == 1
					hash5[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash6 = hash.dup
	(0...3).each do |r|
		(6...9).each do |c|
			next if board[r][c] == '.'
			if hash6[board[r][c]] != nil
				if hash6[board[r][c]] == 1
					hash6[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash7 = hash.dup
	(3...6).each do |r|
		(3...6).each do |c|
			next if board[r][c] == '.'
			if hash7[board[r][c]] != nil
				if hash7[board[r][c]] == 1
					hash7[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash8 = hash.dup
	(3...6).each do |r|
		(6...9).each do |c|
			next if board[r][c] == '.'
			if hash8[board[r][c]] != nil
				if hash8[board[r][c]] == 1
					hash8[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash9 = hash.dup
	(6...9).each do |r|
		(3...6).each do |c|
			next if board[r][c] == '.'
			if hash9[board[r][c]] != nil
				if hash9[board[r][c]] == 1
					hash9[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	hash10 = hash.dup
	(6...9).each do |r|
		(6...9).each do |c|
			next if board[r][c] == '.'
			if hash10[board[r][c]] != nil
				if hash10[board[r][c]] == 1
					hash10[board[r][c]] = 0
				else
					return false
				end
			end
		end
	end
	return true
end

puts is_valid_sudoku([["8","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]])

 
