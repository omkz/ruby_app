require '../lib/parking_lot'
require '../lib/driver'

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

  end
end
