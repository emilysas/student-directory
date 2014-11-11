def input_students
  print "Please enter the names of the students\nTo finish, just hit return twice\n"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do 
    # add the student hash to the array
    students << {:name => name, :cohort => :november}
    print "Now we have #{students.length} students\n"
    # get another name from the user
    name = gets.chomp  
  end
  # return the array of students
  students
end

def print_header
  print "The students of my cohort of Makers Academy\n----------------"
end

def print_names(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  print "Overall, we have #{names.length} great students\n"
end

students = input_students
print_header
print_names(students)
print_footer(students)