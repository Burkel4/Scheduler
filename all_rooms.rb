class All_rooms
    attr_reader :building, :room, :capacity, :computers_available, :seating_available, :food_allowed, :priority, :room_type
    
    def initialize(input_fields, headers)
        @building = input_fields[headers[0]]
        @room = input_fields[headers[1]]
        @capacity = input_fields[headers[2]]
        @computers_available = input_fields[headers[3]]
        @seating_available = input_fields[headers[4]]
        @seating_type = input_fields[headers[5]]
        @food_allowed = input_fields[headers[6]]
        @priority = input_fields[headers[7]]
        @room_type = input_fields[headers[8]]
    end
end