#add array to stack in order from the first
#if detect there is 2 consecutive numbers, followed by a operator
#pop the operator, conduct the operation where the first of the two in the stack will be on the left of the operand, and then the second on the right.
#Then push result back into stack

#** if elem, pop 2 from stack, add, then push back to stack
def reverse(arr)
  stack = []
    arr.each do |elem|
      if elem.is_a?(String)
        second = stack.pop
        first = stack.pop
        third = first.method(elem).(second)
        stack << third
      else
        stack << elem
      end
      puts third
  end
end

reverse([2,3,4,'*','+'])
