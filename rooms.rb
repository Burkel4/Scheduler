# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: rooms.rb
# Description: Creates the booked room objects, whose attributes can be viewed in other files
# Last modified on: 3/8/2024
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