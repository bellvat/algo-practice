#how to determine the next number from a program, considering you increment the addition by 1 each time
#it can be represented by 
#-
#--
#---
#adding the slashes will get you there.
#we can represent it by iterating, so increment every 2, and sum
#we can also represent it by recursion, we know we can add the last, left most stack with everything to its right, hence the n, and +triangle will get you the rest of the sums

def triangle(num)
  if num == 1
    return 1
  else
    return (num + triangle(num-1))
  end
end

