require 'csv'
require_relative 'user.rb'
require_relative 'rooms.rb'
require_relative 'all_rooms.rb'

class Input

    def initialize(user) #create an object with all the room fields
        @all_rooms = user.get_all_rooms()
        @unavailable = user.get_unavailable_rooms()
        @output = user.get_output()
    end

    def parse_all_rooms() #need to validate data T-T
        all_buildings = {}
        all_rooms = {}
        headers = []
        data = CSV.foreach((@all_rooms), headers: true, col_sep: ",") do |row|
            headers = row.headers.to_a #a string of the file headers
            new_room = All_rooms.new(row, headers) #create a new_room object with line info and headers
            if all_buildings[row["Building"]].nil? #condition if building hasn't been seen yet
                then all_buildings[row["Building"]] = [new_room] #create empty array to store room object
            else 
                all_buildings[row["Building"]].push(new_room) #otherwise add room object to existing building array
            end
        end
        return all_buildings
    end

    def parse_used_rooms()
        all_buildings2 = {}
        all_rooms2 = {}
        headers = []
        data2 = CSV.foreach((@unavailable), headers: true, col_sep: ",") do |row|
            headers = row.headers.to_a #a string of the file headers
            new_room = Rooms.new(row, headers, "u") #create a new_room object with line info and headers
            if all_buildings2[row["Building"]].nil? #condition if building hasn't been seen yet
                then all_buildings2[row["Building"]] = [new_room] #create empty array to store room object
            else 
                all_buildings2[row["Building"]].push(new_room) #otherwise add room object to existing building array
            end
        end
        return all_buildings2
    end

end