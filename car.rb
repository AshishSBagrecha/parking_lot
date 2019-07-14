class Car
	attr_accessor :properties
	
	@properties = Hash.new

	def initialize(regNo,color)
    	@properties = { :RegNo => regNo, :Color => color}
   	end

end