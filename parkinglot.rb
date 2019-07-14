require 'set'
require_relative 'car'
class ParkingLot
	
	def initialize
		@no_of_slots=0
		@slots=Array.new
		@available_slots=Set.new
	end

   	def createSlots(n)
         create = []
   		@no_of_slots=n
   		if @no_of_slots > 0
	   		@no_of_slots.times do |i|
	   			@slots[i+1]=Hash.new 
	   			@slots[i+1].clear
	   			@available_slots.add(i + 1)
        end
        
	   	create <<	"Parking Lot create with #{@no_of_slots} empty slots"
   	
         else
   		create << "cannot accept zero or negative values"
         
   		end 
         create
   	end

   	def status
   		statuses  = []
         puts "slotno \n registration \n color\n"
   		for i in 1..@no_of_slots do          
   			if @slots[i].empty?
   				statuses << " #{i}  Empty"

   			else
   				statuses << " #{i}\n #{@slots[i][:RegNo]}\n #{@slots[i][:Color]}"            
   			end
			end			
   		statuses
   	end

   	def findNearestFreeSlot()
   		nearestEmptySlot = nil
   		@available_slots = SortedSet.new(@available_slots)
   		nearestEmptySlot = @available_slots.collect.first
   		return nearestEmptySlot
   	end

   	def park car
         parking = []
   		nearEmptySlot = findNearestFreeSlot()
   		if nearEmptySlot != nil		
   			@slots[nearEmptySlot] = car.properties
   			@available_slots.delete(nearEmptySlot)
   		parking <<	"Allocated slot no #{nearEmptySlot}"
         
   		else
   		parking <<	"sorry,Parking lot is full"
         
   		end
         parking
   	end

   	def leave slotNo
         leave = []
   		@slots[slotNo].clear
   		@available_slots.add(slotNo)
			leave << "car with slotno #{slotNo} left"
         
         leave
   	end

   	def search_with_color_regno color
			sta =[]
         found =false
			for i in 1..@no_of_slots do
   			if @slots[i][:Color] != nil
					if @slots[i][:Color] == color  
               found = true                
                  sta << "Registration number of car with color #{color}"
   					sta << "#{@slots[i][:RegNo]}"   
                               
					end				
            end
			end
         if found == false then puts "not found" end 
         
			sta
   	end

	def search_with_regno regno
   		a =[]
         found =false
		
   		for i in 1..@no_of_slots do              			
   			if @slots[i][:RegNo] != nil
   				if @slots[i][:RegNo] == regno
                  found = true
                  a << "Slot number of car with RegNo: #{regno}"
   					a << "Slot No #{i}"
                  
              	end
   			end
			end 
         if found == false then puts "not found" end      
		a
	end

      def search_with_color_slotno color
         sta =[]
         found =false
         for i in 1..@no_of_slots do
            if @slots[i][:Color] != nil
               if @slots[i][:Color] == color  
               found = true                
                  sta << "slot number of car with color #{color}"
                  sta << "slot no #{i}"   
                   sta               
               end            
            end
         end
         if found == false then puts "not found" end 
         
         sta
      end

   	def searchwithslot slotno
			b = []
         found =false
   		
   		for i in 1..@no_of_slots do  			
   			if @slots[i]!= nil && i == slotno 
               found = true
               b << "Slot number  #{slotno} contains"
   				b << " #{@slots[i][:RegNo]}, #{@slots[i][:Color]}"
               b
            end
			end
         if found == false then puts "not found" end 
         
			b
   	end  	

end



