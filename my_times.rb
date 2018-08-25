#implement my times with my_each
class Array
  def my_each
    c = 0
    until c == self.size
      yield(self[c])
      c += 1
    end
  end
end
class Integer
  def my_time
    arr = Array.new(self)
    arr.my_each{}
  end
end
