def input_students
  print "Please enter the names and details of the students\nTo finish, just hit return twice\n"
  # create an empty array
  @students = []
  def get_info
    # get the first name
    name = gets.delete "\r\n"
    while !name.empty? do 
      print "Please enter your cohort\n"
      cohort = gets.delete "\r\n"
      if cohort == "" 
        cohort = :december 
      else cohort = cohort.to_sym
      end
      print "Please enter #{name}'s country of birth\n"
      country_of_birth = gets.delete "\r\n"
      print "Please enter #{name}'s height\n"
      height = gets.delete "\r\n"
      print "Please enter #{name}'s hobbies\n"
      hobbylist = gets.delete "\r\n"
      hobbies = []
      hobbies << hobbylist.split{" "}
      
      @students << {:name => name, :cohort => cohort, :hobbies => hobbies, :country_of_birth => country_of_birth, :height => height}
      if @students.length > 1
        print "Now we have #{@students.length} students\n"
      else print "Now we have #{@students.length} student\n"
      end
      # get another name from the user
      puts "Please enter another name, or press enter to finish:"
      name = gets.delete "\r\n"
    end
    
  end
  get_info
  # return the array of students
  @students
end

def print_header
  print "The students of my cohort of Makers Academy\n----------------\n"
end

def print_names(names)
  for name in names 
    i = 0
    while i < names.length 
      i += 1 
      #if name[:cohort]==:december 
        puts name
      #end
    end
  end
end

def print_footer(names)
  if names.length > 1
    print "Overall, we have #{names.length} great students\n"
  else print "Overall, we have 1 great student\n"
  end
end

students = input_students
print_header
print_names(students)
print_footer(students)