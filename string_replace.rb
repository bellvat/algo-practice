#write a method that replaces all spaces in a string with "%20"
# detect the spaces, then replace?
# use regex to replace all spaces
# one solution is to not use regex
# string -> arr, replace?, set that element to equal %20
def replace_str(s)
  arr = s.chars
  arr.each_with_index do |n,ind|
    p n
    if n == " "
      arr[ind] = "%20"
    end
  end
  p arr.join("")
end
replace_str(" h ello ")
