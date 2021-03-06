require_relative 'parking_lot'
require_relative 'driver'

class Engine

  class << self

    def create_parking_lot(capacity)
      @parking_lot = ParkingLot.new(capacity)
    end

    def get_slots()
      @parking_lot.slots
    end

    def get_available_slot_number
      a = Array(1..@parking_lot.capacity)
      available_slot = @parking_lot.slots.keys
      available = a - available_slot
      available[0]
    end

    def status
      @parking_lot.slots.each do |key, value|
        print key, " | "
        print value.number_plate, " | "
        print value.color, " \t | \n"
      end
    end

    def get_capacity
      @parking_lot.capacity
    end

    def registration_numbers_for_cars_with_colour(color)
      cars = @parking_lot.slots.select{|key, value| value.color == "#{color}" }
      cars.map{|k,v| "#{v.number_plate}"}.join(',')
    end

    def slot_numbers_for_cars_with_colour(color)
      cars = @parking_lot.slots.select{|key, value| value.color == "#{color}" }
      cars.map{|k,v| "#{k}"}.join(',')
    end

    def slot_number_for_registration_number(number_plate)
      cars = @parking_lot.slots.select{|key, value| value.number_plate == "#{number_plate}" }
      slot_numbers = cars.map{|k,v| "#{k}"}.join(',')

      if cars.length > 0
        slot_numbers
      else
        puts "Not found"
      end
    end

    end
end
