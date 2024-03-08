# Project name: Assignment 1 Scheduler
# Description: Develop a module, called Scheduler, that will schedule rooms for large events, based on availability, capacity, seating, and other characteristics.
# Filename: user.rb
# Description: Create user objects based on information inputted by the user that is visible to other files/classes
# Last modified on: 3/8/2024
require 'date'
class UserInterface

  def initialize()
    @date
    @time
    @duration
    @attendees
    @all_rooms
    @usedRooms
    @output
  end
  
  def valid_date?()
    # Split the date string into year, month, and day components
    year, month, day = @date.split('-').map(&:to_i)
    begin
      #Determines if the input is a valid date in Gregorian calendar
      Date.valid_date?(year, month, day)
  rescue ArgumentError
    return false
    end
  end

  def get_date()
    return @date
  end
  
  def get_time()
    return @time
  end
  
  def get_duration()
    return @duration
  end
  
  def get_attendees()
    return @attendees
  end
  
  def get_all_rooms()
    return @all_rooms
  end
  
  def get_unavailable_rooms()
    return @usedRooms
  end

  def get_output()
    return @output
  end

  def event_date()
    print "Please enter the date of your event yyyy-mm-dd \n"
    #Prompt for user input
    @date = gets.chomp
    #Will keep prompting for a valid event date
    while valid_date?() == false
      print "Invalid date \n"
      print "Please enter the date of your event yyyy-mm-dd \n"
      @date = gets.chomp
    end
  end

  def event_time()
    #Boolean val to be check condition in loop
    is_invalid_time = true
    print "Please enter the time of your event hh:mm PM/AM \n"
    #While input is invalid, keep prompting for input
    while is_invalid_time == true
      #Prompt for user input
      @time = gets.chomp
      #Checks if hour is 01 -> (0[1-9])...12 -> (1[0-2])
      #Checks if minutes is from 00-59 -> [0-5][0-9]
      if @time =~/^(0[1-9])|(1[0-2])[\:][0-5][0-9]\s(AM)|(PM)/
        is_invalid_time = false
      else print "Invalid time \n"
      end
    end
  end

  def event_duration()
    #Boolean val to be check condition in loop
    is_invalid_duration = true
    print "Please enter the duration for your event hh:mm \n"
    #While input is invalid, keep prompting for input
    while is_invalid_duration == true
      #Prompt for user input
      @duration = gets.chomp
      #Checks if hour is 01 -> (0[1-9])...12 -> (1[0-2])
      #Checks if minutes is from 00-59 -> [0-5][0-9]
      if @duration =~/^[0-9][0-9][\:][0-5][0-9]/
        is_invalid_duration = false
      else print "Invalid duration \n"
      end
    end
  end

  def event_attendees()
  #Boolean val to be check condition in loop
  is_invalid_attendees = true
  print "Please enter the number of attendees for your event \n"
  #While input is invalid, prompt for input again
  while is_invalid_attendees
    #Prompt for user input
    @attendees = gets.chomp
    #Attendees must be a positive number
    if @attendees =~ /^\d+$/ && @attendees.to_i > 0
      is_invalid_attendees = false
    else print "Invalid attendance number \n"
    end
  end
  end


    def all_rooms_file()
      #A loop that will kep prompting the user for a valid file name
      while true
        print "Please enter the file name for all rooms \n"
        #Get user input
        @all_rooms = gets.chomp
        #User input must be a .csv and exist
      if @all_rooms =~ /[\w+\-.]\.csv/ && File.exist?(@all_rooms)
        break
      else
        print "Invalid file name for unreserved rooms \n" 
      end
    end
      return @all_rooms
    end

    def unavailable_rooms_file()
      #A loop that will kep prompting the user for a valid file name
      while true
        print "Please enter the file name for reserved rooms \n"
        #Get user input
        @usedRooms = gets.chomp
      if @usedRooms =~ /[\w+\-.]\.csv/ && File.exist?(@usedRooms)
        break
      else print "Invalid file name for reserved rooms \n"
      end
    end
      return @used_rooms
    end

    def output_file()
      print "Please enter the output file name \n"
      @output = gets.chomp
      if @output =~ /[\w+\-.]\.csv/
      else print "Invalid output file title \n"
      end
      return @output
    end
end
