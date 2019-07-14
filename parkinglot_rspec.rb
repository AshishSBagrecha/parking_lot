require 'rspec'
require_relative 'parkinglot'
RSpec.describe ParkingLot do
	describe "createSlots" do
  		it "does not accept negative numbers" do
  			parking=ParkingLot.new
  			expect(parking.createSlots(-1)).to eq(["cannot accept zero or negative values"])
  		end

  		it "accepts non zero positive numbers" do
  			parking=ParkingLot.new
  			expect(parking.createSlots(6)).to eq(["Parking Lot create with 6 empty slots"])
  		end


  		it "accepts zero positive numbers" do
  			parking=ParkingLot.new
  			expect(parking.createSlots(0)).to eq(["cannot accept zero or negative values"])
  		end
  	
	end

	describe "status" do
		it "shows the empty slots in parking lot" do
			parking=ParkingLot.new
			parking.createSlots(3)
      parking.status
			expect(parking.status).to eq([" 1  Empty", " 2  Empty", " 3  Empty"])
		end
		it " shows some of the  slots filled in parking lot" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			parking.park(car1)
			parking.park(car2)
			parking.status
			expect(parking.status).to eq([" 1\n 1111\n Red", " 2\n 1122\n Black", " 3  Empty"])

		end
		it "shows parking full" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			
			parking.status
			expect(parking.status).to eq([" 1\n 1111\n Red", " 2\n 1122\n Black", " 3\n 1133\n Blue"])
		end
	end
	describe "findnearestfreeslots" do
		it "returns nil if there no empty parking slots" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			car4 = Car.new("1133", "black")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			parking.park(car4)
			expect(parking.findNearestFreeSlot).to eq(nil)
		end
		it "return nearest parking slot which is empty" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			parking.park(car1)
			parking.park(car2)
			expect(parking.findNearestFreeSlot).to eq(3)
		end
	end

	describe "park" do
		it "parks the car at nearest empty slot" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			expect(parking.park(car1)).to eq(["Allocated slot no 1"])
		end

		it "tells that parking lot is full" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			car4 = Car.new("1133", "black")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			parking.park(car4)
			expect(parking.park(car1)).to eq(["sorry,Parking lot is full"])
		end
  end

  describe "search with color for registration number" do
    it "returns the registration number and slot no of the parked car" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			expect(parking.search_with_color_regno("Black")).to eq(["Registration number of car with color Black", "1122"])
			    end
  end

describe "search with color for slot number" do
    it "returns the registration number and slot no of the parked car" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			expect(parking.search_with_color_slotno("Red")).to eq(["slot number of car with color Red", "slot no 1"])
			    end
  end

	describe "search with registration number" do
		it "returns color and slot no of the parked car" do
			parking=ParkingLot.new
			parking.createSlots(3)
			car1 = Car.new("1111", "Red")
			car2 = Car.new("1122", "Black")
			car3 = Car.new("1133", "Blue")
			parking.park(car1)
			parking.park(car2)
			parking.park(car3)
			expect(parking.search_with_regno("1111")).to eq(["Slot number of car with RegNo: 1111", "Slot No 1"])
		end
  end

  describe "leaving of the car from a parking lot" do
    it "returns the confirmation about the car that has left" do
      parking=ParkingLot.new
      parking.createSlots(3)
      car1 = Car.new("1111", "red")
      car2 = Car.new("1122", "Black")
      car3 = Car.new("1133", "Blue")
      parking.park(car1)
      parking.park(car2)
      parking.park(car3)
      expect(parking.leave(2)).to eq(["car with slotno 2 left"])
    end
	end
end
