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

  def event_date() #Gets the date of a club's event
    print "Please enter the date of your event \n"
    @date = gets.chomp #Prompt for user input, line 8 will then validate the input (very long yikes!)
    if @date =~ /^(20[2-9][4-9])|([2-9][1-9]\d{2})[\-]((((0[13578])|([13578])|(1[02]))[\/](([1–9])|([0–2][0–9])|(3[01])))|(((0[469])|([469])|(11))[\-](([1–9])|([0–2][0–9])|(30)))|((2|02)[\-](([1–9])|([0–2][0–9]))))/
    else print "Invalid date \n"
    end
  end

  def event_time()
    print "Please enter the time of your event \n"
    @time = gets.chomp
    if @time =~/^(0[1-9])|(1[0-2])[\:][0-5][0-9]\s(AM)|(PM)/
    else print "Invalid time \n"
    end
  end

  def event_duration()
    print "Please enter the duration for your event \n"
    @duration = gets.chomp
    if @duration =~/^(0[1-9])|(1[0-2])[\:][0-5][0-9]/
    else print "Invalid duration \n"
    end
  end

  def event_attendees()
    print "Please enter the number of attendees for your event \n"
    @attendees = gets.chomp
    if @attendees =~ /^\d+$/ && @attendees.to_i > 0
    else print "Invalid attendance number \n"
      end
  end


    def all_rooms_file()
      print "Please enter the file name for all rooms \n"
      @all_rooms = gets.chomp
      if @all_rooms =~ /[\w+\-.]\.csv/
      else print "Invalid file name for unreserved rooms \n"
      end
      return @all_rooms
    end

    def unavailable_rooms_file()
      print "Please enter the file name for reserved rooms \n"
      @usedRooms = gets.chomp
      if @usedRooms =~ /[\w+\-.]\.csv/
      else print "Invalid file name for reserved rooms \n"
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
