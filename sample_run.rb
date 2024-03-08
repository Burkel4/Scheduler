# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: sample_run.rb
# Description: A program with all files inserted to test functionality
# Last modified on: 3/8/2024

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

#Create a class to get rin of global variables
class SchedulerApp
    def initialize
        @user_interface = UserInterface.new
        @input_object = nil
        @generate_object = nil
        @display_object = nil
        @output_object = nil
      end

    def run
    @user_interface.event_attendees
    @user_interface.event_date
    @user_interface.event_duration
    @user_interface.event_time
    @input_object = Input.new(@user_interface)
    
    # Set user inputs and save file names
    input_file1 = @user_interface.all_rooms_file
    input_file2 = @user_interface.unavailable_rooms_file
    output_file = @user_interface.output_file
    
    # Parse files
    parsed_all_rooms = @input_object.parse_all_rooms
    parsed_unavailable_rooms = @input_object.parse_used_rooms

    @generate_object = Generate.new(@input_object, @user_interface)
    
    # Generate a Scheduling Plan
    non_filtered_schedule = @generate_object.generate_plan
    filtered_schedule = @generate_object.best_schedule(non_filtered_schedule)

    @display_object = Display.new(@user_interface, @generate_object)
    
    # Display Scheduling Plans
    @display_object.display_non_filtered(@generate_object)
    @display_object.display_filtered(@generate_object)

    @output_object = Output.new(@user_interface, @generate_object)
    
    # Write Schedule to .CSV file
    @output_object.write_to_file(@generate_object)
  end
end

scheduler_app = SchedulerApp.new
scheduler_app.run