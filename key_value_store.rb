class KeyValue
	def initialize
		@hashT = Hash.new
	end
	def insert(value)
		time = Time.now.getutc
		@hashT[time] = value 	
	end
end
#key value store with history
#people recommended using time stamps
