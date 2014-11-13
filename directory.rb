@students = []

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  print "Please enter the names and details of the students\nTo finish, just hit return twice\n"

  name = STDIN.gets.chomp
  while !name.empty? do 
    print "Please enter your cohort\n"
    cohort = STDIN.gets.chomp
    if cohort == "" 
      cohort = :december 
    else cohort = cohort.to_sym
    end
    print "Please enter #{name}'s country of birth\n"
    country_of_birth = STDIN.gets.chomp
    print "Please enter #{name}'s height\n"
    height = STDIN.gets.chomp
    print "Please enter #{name}'s hobbies\n"
    hobbylist = STDIN.gets.chomp
    hobbies = []
    hobbies << hobbylist.split{" "}
    add_student(name, cohort, country_of_birth, height, hobbies)
    if @students.length > 1
      print "Now we have #{@students.length} students\n"
    else print "Now we have #{@students.length} student\n"
    end
    # get another name from the user
    puts "Please enter another name, or press enter to finish:"
    name = STDIN.gets.chomp
    break
  end
  # return the array of students
  @students
end

def add_student
   @students << {:name => name, :cohort => cohort, :hobbies => hobbies, :country_of_birth => country_of_birth, :height => height}
 end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {:name => name, :cohort => cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def print_header
  print "The students of my cohort of Makers Academy\n----------------\n"
end

def print_students_list(names)
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
  else print "Overall, we have #{names.length} great student\n"
  end
end

#students = input_students
#print_header if students.length > 0
#print_names(students) if students.length > 0
#print_footer(students) if students.length > 0

try_load_students
interactive_menu
