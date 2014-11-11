# let's put all students into an array
students = [
  {:name => "Matteo Manzo", :cohort => :december},
  {:name => "Marcin Wal", :cohort => :december},
  {:name => "Ptolemy Barnes", :cohort => :december},
  {:name => "Luke Clewlow", :cohort => :december},
  {:name => "Emily Sas", :cohort => :december},
  {:name => "Charlie Walsh", :cohort => :december},
  {:name => "Huy Lee", :cohort => :december}
]

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "----------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.length} great students"
end

# nothing happens untl we call the methods
print_header
print(students)
print_footer(students)