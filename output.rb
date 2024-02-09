require 'csv'
require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'
require_relative 'generate.rb'

class Output
    def initialize(user, generate_object)
        @title = user.get_output()
        @date = user.get_date
        @time = user.get_time
    end

    def write_to_file(generate_object)
        schedule = generate_object.generate_plan()
        meals = schedule[:meals]
        sessions = schedule[:opening_session]
        projects = schedule[:project_rooms]
        flat_meals = meals.flatten
        flat_sessions =sessions.flatten
        flat_projects = projects.flatten
        data = []
        schedule.each_key do |tag|
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
        headers = "Date, Time, Building, Room, Capacity, Computers Available, Seating Available, Seating Type, Food Allowed, Room Type, Priority, Purpose"
        CSV.open(@title, 'w') do |csv|
            csv << headers.split(',') #writes string as headers in csv file
            data.each do |row|
              csv << row.values
            end
        end
    end

end