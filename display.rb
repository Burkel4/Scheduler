require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'
require_relative 'generate.rb'

class Display
    def initialize(user, generate_object)
        @date = user.get_date
        @time = user.get_time
    end
    def display_non_filtered(generate_object)
        print "Non-priority Schedule", "\n", " Date: ", @date, "\n"
        print " Time: ", @time, "\n", " ", "All rooms available:", "\n"
        #iterate through hash saving keys and values
        schedule = generate_object.generate_plan()
        #print schedule
        meals = schedule[:meals]
        sessions = schedule[:opening_session]
        projects = schedule[:project_rooms]
        flat_meals = meals.flatten
        flat_sessions =sessions.flatten
        flat_projects = projects.flatten
        schedule.each_key do |tag|
            if schedule[tag] = flat_meals
                flat_meals.each do |room_objects|
                print "\n", " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
                print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
                print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available), " |Food Allowed: "
                print room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: ", tag, "\n"
                end
                
            end
            if schedule[tag] = flat_sessions
                flat_sessions.each do |room_objects|
                print " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
                print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
                print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available), " |Food Allowed: "
                print room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: ", tag, "\n"
                end
                
            end
            if schedule[tag] = flat_projects
                flat_projects.each do |room_objects|
                print " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
                print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
                print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available), " |Food Allowed: "
                print room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: ", tag, "\n"
                end
                
            end
        end
    end
    
    def display_filtered(generate_object)
        print "Priority Schedule", "\n", " Date: ", @date, "\n"
        print " Time: ", @time, "\n", " ", "All rooms available:", "\n"
        schedule = generate_object.generate_plan()
        priority = generate_object.best_plan(schedule)
        priority_schedule = priority.flatten
        priority_schedule.each_with_index do |room_objects, index|
            next if index == 0
            print " Building: ", room_objects.instance_variable_get(:@building), " |Room number: "
            print room_objects.instance_variable_get(:@room), " |Capacity: ", room_objects.instance_variable_get(:@capacity)
            print " |Computers Available: ", room_objects.instance_variable_get(:@computers_available), " |Food Allowed: ", room_objects.instance_variable_get(:@food_allowed), " |Event Purpose: "
            print generate_object.room_purpose(room_objects, schedule), "\n"
        end
    end

end