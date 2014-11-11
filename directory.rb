# let's put all students into an array
students = [
  "Matteo Manzo"
  "Marcin Wal"
  "Ptolemy Barnes"
  "Luke Clewlow"
  "Emily Sas"
  "Charlie Walsh"
  "Huy Lee"
]
# first we print the list of students
puts "The students of my cohort at Makers Academy"
puts "----------------"
students.each do |student|
  puts student
end

# finally, we print the total
puts "Overall, we have #{students.length} great students"