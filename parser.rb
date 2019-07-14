require_relative "parkinglot"
class Parser

  def initialize
    @parking_lot  = ParkingLot.new
  end

  def parse input_string
	p input_string
    tokenized_string = input_string.split(" ")
    action = tokenized_string.shift    
    argument = tokenized_string
    
      if action ==  "create_parking_lot"
        @parking_lot.createSlots(argument[0].to_i)

      elsif action == "park"        
       car = Car.new(argument[0],argument[1]) 
       @parking_lot.park(car)

            
      elsif action == "leave"
        @parking_lot.leave(argument[0].to_i)

      elsif action == "status"       
        @parking_lot.status        

      elsif action == "search_with_color_slotno"
        @parking_lot.search_with_color_slotno(argument[0])
        

      elsif action == "search_with_regno"
        @parking_lot.search_with_regno(argument[0])

      elsif action == "search_with_color_regno"
        @parking_lot.search_with_color_regno(argument[0])

      else
       "Invalid Input"
    end
  end

end
