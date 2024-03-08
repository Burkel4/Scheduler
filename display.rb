# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: display.rb
# Description: Class intended for presenting scheduling information to users. The class includes methods for displaying both non-priority and priority schedules
# Last modified on: 3/8/2024

require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'
require_relative 'generate.rb'

class Display
    # Constructor for the Display class, initializes instance variables.
    def initialize(user, generate_object)
        @date = user.get_date
        @time = user.get_time
    end

    # Display non-priority schedule information.
    def display_non_filtered(generate_object)
        print "Non-priority Schedule", "\n", " Date: ", @date, "\n"
        print " Time: ", @time, "\n", " ", "All rooms available:", "\n"

        # Generate the scheduling plan
        schedule = generate_object.generate_plan()

        # Extract relevant information from the plan
        meals = schedule[:meals]
        sessions = schedule[:opening_session]
        projects = schedule[:project_rooms]
        flat_meals = meals.flatten
        flat_sessions = sessions.flatten
        flat_projects = projects.flatten

        # Iterate through each key (tag) in the schedule
        schedule.each_key do |tag|
            if schedule[tag] == flat_meals
                # Display information for each room object in flat_meals
                flat_meals.each do |room_objects|
                    display_room_information(room_objects, tag)
                end
            elsif schedule[tag] == flat_sessions
                # Display information for each room object in flat_sessions
                flat_sessions.each do |room_objects|
                    display_room_information(room_objects, tag)
                end
            elsif schedule[tag] == flat_projects
                # Display information for each room object in flat_projects
                flat_projects.each do |room_objects|
                    display_room_information(room_objects, tag)
                end
            end
        end
    end
    
    # Display priority schedule information.
    def display_filtered(generate_object)
        print "Priority Schedule", "\n", " Date: ", @date, "\n"
        print " Time: ", @time, "\n", " ", "All rooms available:", "\n"

        # Generate the scheduling plan
        schedule = generate_object.generate_plan()

        # Get the best plan based on priority
        priority = generate_object.best_plan(schedule)
        priority_schedule = priority.flatten

        # Iterate through each room object in the priority schedule
        priority_schedule.each_with_index do |room_objects, index|
            next if index == 0 # Skip the first element (not used)

            # Display information for each room object in the priority schedule
            print " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
            print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
            print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available)
            print " |Food Allowed: ", room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: "
            print generate_object.room_purpose(room_objects, schedule), "\n"
        end
    end

    # Helper method to display information for a room object
    def display_room_information(room_objects, tag)
        print "\n", " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
        print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
        print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available), " |Food Allowed: "
        print room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: ", tag, "\n"
    end
end