# Scheduler

# Instructions for running the program:

  Ensure “output.csv” file is blank

  In terminal type “ruby sample_run.rb”

  Type in date, start time, and duration as outlined in the limitations section of SchedulerNotes.pdf
  
  Type in “rooms_list.csv” when asked for the file title for all rooms
  
  Type in “reserved_rooms.csv” when asked for the file title for used/unavailable rooms
  
  Type in “output.csv” when asked for the file title for the output file

# Known bugs, issues or limitations:

  Does not validate the data in user inputted files, will create inaccurate scheduling plans if data is not in desired format
  
  If input is invalid, forced to exit program with CTRL^C/CMD^C
  
  When inputting duration, MUST be hh:mm format, ex: 3:30 would be invalid but 03:30 would not
  
  When inputting start time, there MUST be a space before AM or PM; AM and PM must be all capitalized with nothing separating the characters (am/pm, a.m/p.m not accepted)
  
  When inputting data, must be yyyy-mm-dd starting only after 2024, years prior to 2024 will be counted ass invalid, dashes MUST be included
