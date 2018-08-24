#adding binary numbers, rules are 0+0 = 0, 1+1 = 10, you carry over the ones


def add_binary(a,b)
	sum = a + b
	arr = sum.to_s.chars.map{|i| i.to_i}
	flag = 0
	(arr.length-1).downto(0) do |i|
		tot = arr[i] + flag
		p flag
		flag = 0
		if tot == 2 && i == 0
			arr[i] = 0
			arr.unshift(1)
		elsif tot == 2
			arr[i] = 0
			flag = 1
		end
		p arr
	end
	p arr
end

add_binary(101001, 10011)
