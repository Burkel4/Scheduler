# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: output.rb
# Description: Class is responsible for generating and writing a scheduling plan to a CSV file.
# Last modified on: 3/8/2024

require 'csv'
require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'
require_relative 'generate.rb'

class Output
    def initialize(user, generate_object)
        # File path for the output CSV file
        @title = user.get_output()
        @date = user.get_date
        @time = user.get_time
    end

    def write_to_file(generate_object)
        # Generate scheduling plan from the Generate object
        schedule = generate_object.generate_plan()
        # Extract information about meals, sessions, and projects from the schedule
        meals = schedule[:meals]
        sessions = schedule[:opening_session]
        projects = schedule[:project_rooms]
        flat_meals = meals.flatten
        flat_sessions =sessions.flatten
        flat_projects = projects.flatten
        # Array to store data for CSV
        data = []
        # Iterate through each key (tag) in the schedule
        schedule.each_key do |tag|
            # Display information for each room object in flat_meals
            if schedule[tag] = flat_meals
                flat_meals.each do |room_objects|
                hash = {'Date' => @date, 'Time' => @time,'Building' => room_objects.instance_variable_get(:@building),
                'Room' => room_objects.instance_variable_get(:@room), 'Capacity' => room_objects.instance_variable_get(:@capacity),
                'Computers Available' => room_objects.instance_variable_get(:@computers_available), 'Seating Available' => room_objects.instance_variable_get(:@seating_available),
                'Seating Type' => room_objects.instance_variable_get(:@seating_type), 'Food Allowed' => room_objects.instance_variable_get(:@food_allowed),
                'Room Type' => room_objects.instance_variable_get(:@room_type), 'Priority' => room_objects.instance_variable_get(:@priority), 'Purpose' => tag}
                data << hash
                end
                
            end
            # Display information for each room object in flat_sessions
            if schedule[tag] = flat_sessions
                flat_sessions.each do |room_objects|
                    hash = {'Date' => @date, 'Time' => @time,'Building' => room_objects.instance_variable_get(:@building),
                    'Room' => room_objects.instance_variable_get(:@room), 'Capacity' => room_objects.instance_variable_get(:@capacity),
                    'Computers Available' => room_objects.instance_variable_get(:@computers_available), 'Seating Available' => room_objects.instance_variable_get(:@seating_available),
                    'Seating Type' => room_objects.instance_variable_get(:@seating_type), 'Food Allowed' => room_objects.instance_variable_get(:@food_allowed),
                    'Room Type' => room_objects.instance_variable_get(:@room_type), 'Priority' => room_objects.instance_variable_get(:@priority), 'Purpose' => tag}
                    data << hash
                end
                
            end
            # Display information for each room object in flat_projects
            if schedule[tag] = flat_projects
                flat_projects.each do |room_objects|
                    hash = {'Date' => @date, 'Time' => @time,'Building' => room_objects.instance_variable_get(:@building),
                    'Room' => room_objects.instance_variable_get(:@room), 'Capacity' => room_objects.instance_variable_get(:@capacity),
                    'Computers Available' => room_objects.instance_variable_get(:@computers_available), 'Seating Available' => room_objects.instance_variable_get(:@seating_available),
                    'Seating Type' => room_objects.instance_variable_get(:@seating_type), 'Food Allowed' => room_objects.instance_variable_get(:@food_allowed),
                    'Room Type' => room_objects.instance_variable_get(:@room_type), 'Priority' => room_objects.instance_variable_get(:@priority), 'Purpose' => tag}
                    data << hash
                end
                
            end
        end
        # Headers for CSV file
        headers = "Date, Time, Building, Room, Capacity, Computers Available, Seating Available, Seating Type, Food Allowed, Room Type, Priority, Purpose"
        # Open a new CSV file and write data to it
        CSV.open(@title, 'w') do |csv|
            # Write headers as the first row in the CSV file
            csv << headers.split(',')
             # Write values for each row in the CSV file
            data.each do |row|
              csv << row.values
            end
        end
    end

end