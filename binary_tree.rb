class Node
	def initialize(data=nil,left=nil,right=nil)
		@data = data
		@left = left
		@right = right
	end
end

class Tree
	def initialize
		@root = Node.new
	end

	def find(key)
		current = @root
		while current.data != key
			if key < current.data
				current = current.left
			else
				current = current.right
			end
			if current == nil
				return nil
			end
		end
		return current
	end

	def insert(key)
		newNode = Node.new(key)
		current = @root
		while true
			parent = current
			if key < current.data
				current = current.left
				if current == nil
					parent.left = newNode			
					return
				end
			else
				current = current.right
				if current == nil
					parent.right = newNode			
					return
				end
			end
		end

	end
	def inorder(root)
		while root != nil
			inorder(root.left)
			p root.data
			inorder(root.right)
		end
	end
end
