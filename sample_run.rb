require 'csv'
require_relative 'input.rb'
require_relative 'user.rb'
require_relative 'all_rooms.rb'
require_relative 'rooms.rb'
require_relative 'generate.rb'
require_relative 'display.rb'
require_relative 'output.rb'
require_relative 'input.rb'
require_relative 'rooms.rb'

user_object = UserInterface.new
#Set user inputs and save file names
user_object.event_attendees()
user_object.event_date()
user_object.event_duration()
user_object.event_time()
input_file1 = user_object.all_rooms_file()
input_file2 = user_object.unavailable_rooms_file()
output_file = user_object.output_file()

input_object = Input.new(user_object)
#Parse files
parsed_all_rooms = input_object.parse_all_rooms()
parsed_unavailable_rooms = input_object.parse_used_rooms()

generate_object = Generate.new(input_object, user_object)
#Generate a Scheduling Plan
non_filtered_schedule = generate_object.generate_plan()
filtered_schedule = generate_object.best_schedule(non_filtered_schedule)
display_object = Display.new(user_object, generate_object)
#Display Scheduling Plans
display_object.display_non_filtered(generate_object)
display_object.display_filtered(generate_object)

output_object = Output.new(user_object, generate_object)
#Write Schedule to .CSV file
output_object.write_to_file(generate_object)
