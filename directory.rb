require 'csv'
require 'byebug'

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
  puts "3. Save the list to file"
  puts "4. Load the list from file"
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
      puts "Please enter the filename you would like to save to"
      filename = STDIN.gets.chomp
      save_students(filename)
    when "4"
      puts "Please enter the filename you would like to load from"
      filename = STDIN.gets.chomp
      load_students(filename)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  @student = {}
  puts "Please enter the names and details of the students\nTo finish, just hit return twice"
  @name = STDIN.gets.chomp
  while !@name.empty? do 
    @student[:name] = @name
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
  questions = ["cohort", "country_of_birth", "height", "hobbies"]
  questions.each do |question|
    puts "Please enter #{@name}'s #{question}"
    answer = STDIN.gets.chomp
    @student.store(question.to_sym, answer)
  end
end

def load_students(filename = "./students.csv")
  CSV.foreach(filename) do |row|
    name, cohort, country_of_birth, height, hobbies = row
    add_student(name, cohort, country_of_birth, height, hobbies)
  end
end

def add_student(name, cohort, country_of_birth, height, hobbies)
    @students << {:name => name, :cohort => cohort, :country_of_birth => country_of_birth, :height => height, :hobbies => hobbies}
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

def save_students (filename = "./students.csv")
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:country_of_birth], student[:height], student[:hobbies]]
    end
  end
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
