# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: all_rooms.rb
# Description: Creates available room objects designed to be instantiated for each entry of room information, allowing for organized storage and retrieval of data related to various rooms.
# Last modified on: 3/8/2024

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