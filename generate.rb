require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'

class Generate
  def initialize(input_object, user)
    @all_available_rooms = input_object.parse_all_rooms
    @unavailable_rooms = input_object.parse_used_rooms

    @date = user.get_date
    @time = user.get_time
    @duration = user.get_duration
    @attendees = user.get_attendees
  end

  def determine_free_rooms
    # iterate through all rooms checking building and room # with other list
    @all_available_rooms.each do |building, array|
      unavailable_array = @unavailable_rooms[building]
      i = 0
      # inner loop through array
      array.each do |room_object|
        if room_object.room == unavailable_array[i].room
          # remove from array that room object since it was on unavailable list
          array.delete(room_object)
        end
        i = i + 1
      end
    end
  end

  def best_plan(scheudle)
    best = best_schedule(scheudle)
    end
  
  def generate_plan
    # create hash that stores all room types we have to schedule
    scheduling_plan = {}

    # Schedule opening session, LATER CHECK FOR SEATING!!!
    scheduling_plan[:opening_session] = find_room_for_event(@all_available_rooms, @attendees)

    # Schedule meals
    meal_duration = 60
    scheduling_plan[:meals] = find_rooms_for_meals(@all_available_rooms, meal_duration, scheduling_plan[:opening_session])

    # Schedule project rooms
    scheduling_plan[:project_rooms] = find_rooms_for_projects(@all_available_rooms, scheduling_plan[:opening_session])
    return scheduling_plan
    end

  def best_schedule(schedule)
    hash_array = schedule.to_a
    flat_array = hash_array.flatten
    index_of_sessions = flat_array.index(:opening_session)
    index_of_meals = flat_array.index(:meals)
    index_of_project_rooms = flat_array.index(:project_rooms)
    groups = flat_array.group_by { |room_object| room_object.instance_variable_get(:@building)}
    priority_schedule = groups.max_by { |_, occurrences| occurrences.length }
    return priority_schedule
  end

    def room_purpose(room, full_schedule)
        hash_array = full_schedule.to_a
        flat_array = hash_array.flatten
        index_of_sessions = flat_array.index(:opening_session)
        index_of_meals = flat_array.index(:meals)
        index_of_project_rooms = flat_array.index(:project_rooms)
            check_index = flat_array.index(room)
            if !check_index.nil?
                if check_index < index_of_meals
                        print "opening or closing session"
                end
                if check_index < index_of_project_rooms && check_index > index_of_meals
                        print "meals"
                end
                if check_index > index_of_project_rooms
                        print "individual or group work"
                end
            end
    end  

  def find_room_for_event(rooms_by_building, attendees)
    all_session_rooms = []
    # Prioritize rooms in the same building
    rooms_by_building.each do |building, array|
      all_session_rooms << array.select { |room_object| room_object.capacity >= attendees }
    end
    return all_session_rooms
  end

  def find_rooms_for_meals(rooms_by_building, duration, sessions)
    # Select multiple rooms for meals
    meal_rooms = []
    remaining_duration = duration
    i = 0
    rooms_by_building.each do |building, array|
      meal_rooms << array.select { |room_object| room_object.food_allowed == 'Yes' && sessions.include?(room_object) == false }
      break if remaining_duration <= 0
      remaining_duration -= array[i].capacity.to_i * 0.6 # Assume 60% of attendees eat in each room
      i = i + 1
    end
    return meal_rooms
  end

  def find_rooms_for_projects(rooms_by_building, sessions)
    project_rooms = []
    # Prioritize rooms in the same building
    rooms_by_building.each do |building, array|
      project_rooms << array.select { |room_object| room_object.computers_available == 'Yes' && sessions.include?(room_object) == false }
    end
    return project_rooms
  end
end