class UserInterface

    def initialize()
    end

    def eventDate() #Gets the date of a club's event
      print "Please enter the date of your event \n"
      date = gets.chomp #Prompt for user input, line 8 will then validate the input (very long yikes!)
      if date =~ /^(20[2-9][4-9])|([2-9][1-9]\d{2})[\-]((((0[13578])|([13578])|(1[02]))[\/](([1–9])|([0–2][0–9])|(3[01])))|(((0[469])|([469])|(11))[\-](([1–9])|([0–2][0–9])|(30)))|((2|02)[\-](([1–9])|([0–2][0–9]))))/
      else print "Invalid date \n"
      end
      end

    def eventTime()
      print "Please enter the time of your event \n"
      time = gets.chomp
      if time =~/^(0[1-9])|(1[0-2])[\:][0-5][0-9]\s(AM)|(PM)/
      else print "Invalid time \n"
      end
      end

    def eventDuration()
      print "Please enter the duration for your event \n"
      duration = gets.chomp
      if duration =~/^(0[1-9])|(1[0-2])[\:][0-5][0-9]/
      else print "Invalid duration \n"
      end
      end

    def eventAttendees()
      print "Please enter the number of attendees for your event \n"
      attendees = gets.chomp
      if attendees =~ /\D|[^1-9]|0/
        then print "Invalid attendance number \n"
      end
      end
    
      def availableRooms()
        print "Please enter the file name for unreserved rooms \n"
        unusedRooms = gets.chomp
        print "Please enter the file name for reserved rooms \n"
        usedRooms = gets.chomp
        print "Please enter the output file name \n"
        output = gets.chomp
        if unusedRooms =~ /[\w+\-.]\.csv/
        else print "Invalid file name for unreserved rooms \n"
        end
        if usedRooms =~ /[\w+\-.]\.csv/
        else print "Invalid file name for reserved rooms \n"
        end
        if output =~ /[\w+\-.]\.csv/
        else print "Invalid output file title \n"
        end
      end
end
