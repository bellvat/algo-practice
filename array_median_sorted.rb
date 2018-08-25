#median of 2 sorted arrays
#combine, merge 2 arrays, and find the middle?

def solution(m,n)
  arr = []
  j = 0
  i = 0
  mlen = m.length
  nlen = n.length
  totallen = mlen + nlen
  if totallen.even?
    med = totallen/2
  else
    med = totallen/2
  end
  if mlen > nlen
    len = mlen
  elsif mlen < nlen
    len = nlen
  else
    len = nlen
  end

  (0..med).each do |e|
    #greater than is important, because if j is less than, it will satisfy the if statment
    if j > (nlen-1)
      arr << m[j]
      j += 1
    elsif i > (mlen-1)
      arr << n[i]
      i += 1
    elsif m[j] > n[i]
      arr << n[i]
      i += 1
    elsif m[j] < n[i]
      arr << m[j]
      j += 1
    end
    p arr
  end
  if totallen.even?
    return (arr[med] + arr[med-1])/2
  else
    return arr[med]
  end
end


puts solution([2,3,4],[1,5,6,7])
