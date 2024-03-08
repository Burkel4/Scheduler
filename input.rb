# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: input.rb
# Description: Class is responsible for parsing information from CSV files related to available and unavailable rooms.
# Last modified on: 3/8/2024

require 'csv'
require_relative 'user.rb'
require_relative 'rooms.rb'
require_relative 'all_rooms.rb'

class Input

    # Constructor to create an Input object with references to file paths
    def initialize(user)
        # File path for all available rooms
        @all_rooms = user.get_all_rooms()
        # File path for unavailable rooms
        @unavailable = user.get_unavailable_rooms()
        # File path for output
        @output = user.get_output()
    end

    # Parse the file containing information about all available rooms
    def parse_all_rooms()
        # Hash to store rooms grouped by building
        all_buildings = {}
        all_rooms = {}
        # Array to store file headers
        headers = []
        data = CSV.foreach((@all_rooms), headers: true, col_sep: ",") do |row|
            # Save headers for later reference
            headers = row.headers.to_a
            # Create a new All_rooms object with line info and headers
            new_room = All_rooms.new(row, headers)
            # Check if building hasn't been seen yet
            if all_buildings[row["Building"]].nil?
                # Create an empty array to store the room object
                then all_buildings[row["Building"]] = [new_room]
            else 
                # Add the room object to the existing building array
                all_buildings[row["Building"]].push(new_room)
            end
        end
        # Return the hash of all available rooms grouped by building
        return all_buildings
    end

     # Parse the file containing information about all unavailable rooms
    def parse_used_rooms()
        # Hash to store rooms grouped by building
        all_buildings2 = {}
        all_rooms2 = {}
        # Array to store file headers
        headers = []
        data2 = CSV.foreach((@unavailable), headers: true, col_sep: ",") do |row|
            # Save headers for later reference
            headers = row.headers.to_a
            # Create a new Rooms object for unavailable rooms with line info and headers
            new_room = Rooms.new(row, headers, "u")
            # Check if building hasn't been seen yet
            if all_buildings2[row["Building"]].nil?
                 # Create an empty array to store the room object
                then all_buildings2[row["Building"]] = [new_room]
            else 
                # Add the room object to the existing building array
                all_buildings2[row["Building"]].push(new_room)
            end
        end
        # Return the hash of unavailable rooms grouped by building
        return all_buildings2
    end

end