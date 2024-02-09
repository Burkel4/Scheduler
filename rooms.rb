class Rooms
    attr_reader :building, :room
    
    def initialize(input_fields, headers, char)
        @building = input_fields[headers[0]]
        @room = input_fields[headers[1]]
        @date = input_fields[headers[2]]
        @time = input_fields[headers[3]]
        @duration = input_fields[headers[4]]
        @booking_type = input_fields[headers[5]]
    end

end