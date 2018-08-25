#quick sort depends on partition
#like merge sort, it is divide and conquer
#can pick a random element to partition on
#[- - 30 50 40], if i choose last to be pivot, i will be going through each element, like have 2 tracking variables, then increment and swap depending on whether the element is less then the pivot or not
#lets explain quick sort in layman terms
#we are picking a pivot, and moving all lower elements to the left of pivot
#by the algo below, we are keeping a tracker of the p_index, the p_index is where we know the element is Greater than or Equal to the pivot
#we move through the elements using incrementing i
#at the end, we place our pivot before the p_index, because we know that the elements Equal to or to the right of the p_index is Greater than or Equal to the pivot
#at the sort, we are working with the same array, just at different lows and highs, once a pivot is used, it is not used again, only the left and right sides are used, as indicated by p+1, or p-1
def partition(a,l,r)
  pivot = a[r]
  i = l
  p_index = l

  while i < r
    if a[i] <= pivot
      temp = a[i]
      a[i] = a[p_index]
      a[p_index] = temp
      p_index += 1
    end
    i += 1
  end
  temp = a[p_index]
  a[p_index] = a[r]
  a[r] = temp
  return p_index
end

def sort(a,l,r)
  if l<r #this prevents us to evaluate 1 element like [7], because the lowest is equal to the highest
    p = partition(a,l,r)
    sort(a,l,p - 1)
    sort(a,p + 1,r)
  end
  return a
end

#[5,4,3,6] -> #[

def partition1(a,l,r)
  i = l #i is the first element
  j = r+1 #j is the last element..plus one because..?
  pivot = a[l] #pivoting at the lowest element
  while true
    begin
      i+=1 #moving up from the lowest index
      break if i==r #stop if the lowest index == highest index
    end while a[i]<pivot #keep going while lowest element is less than pivot
    begin
      j-=1 #moving down from highest index
      break if j==l #break if the highest index is == lowest index(l stable)
    end while a[j]>pivot #keep going while element is higher than pivot
    break if i>=j #stop if lowest incremented index == highest incremented index
    temp=a[i] #swap incremented indices with each other
    a[i]=a[j]
    a[j]=temp
   puts a
  end

  temp=a[l] #swap the lowest with the highest j..?
  a[l]=a[j]
  a[j]=temp
   puts a
  return j
end

