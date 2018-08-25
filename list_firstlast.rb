#create a pointer for first and last links

class Node
  attr_accessor :data, :next
  def initialize(data, nextNode=nil)
    @data = data
    @next = nextNode
  end

  def show
    puts "Data is #{@data} and next is #{@next}"
  end
end

class List
  def initialize
    @head = nil
    @tail = nil
  end
  def displayLink
    first = @head
    while first != nil
      first.show
      first = first.next
    end
  end

  def insertFirst(data)
     new_link = Node.new(data)
    if @head == nil
      @tail = new_link #because you're inserting in the beginning, you only need to update the @tail once..?
    end
      new_link.next = @head
      @head = new_link
  end

  def insertLast(data)
    new_link = Node.new(data)
    if @head == nil
      @head = new_link
    else
      @tail.next = new_link
    end
      @tail = new_link #set @tail to the last link, the newest last link
  end
  def deleteFirst
    if @head.next == nil
      @tail = nil
    end
    @head = @head.next
  end
end
