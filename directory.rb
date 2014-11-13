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
  @student = []
  puts "Please enter the names and details of the students\nTo finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do 
    @student << @name
    get_details
    @students << @student
    if @students.length > 1
      puts "Now we have #{@students.length} students"
    else puts "Now we have #{@students.length} student"
    end
    input_students
    break
  end
  @students
end

def get_details
  questions = ["cohort", "country of birth", "height", "hobbies"]
  questions.each do |question|
    puts "Please enter #{@name}'s #{question}"
    answer = STDIN.gets.chomp
    @student << "#{question.to_sym}: #{answer}"
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, country_of_birth, height, hobbies = line.chomp.split(',')
    @students << {:name => name, :cohort => cohort.to_sym, :country_of_birth => country_of_birth, :height => height, :hobbies => hobbies}
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
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:country_of_birth], student[:height], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


def print_header
  puts "The students of my cohort of Makers Academy\n----------------"
end

def print_students_list(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  if names.length > 1
    puts "Overall, we have #{names.length} great students"
  else puts "Overall, we have #{names.length} great student"
  end
end

try_load_students
interactive_menu
