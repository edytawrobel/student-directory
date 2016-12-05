#let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

puts "The students of Villains Academy"
puts "-------------"
#puts students[0..10]
#array iteration to print the list of all students
students.each do |student|
  puts student
end

#using the array's count() method to count students
print "Overall, we have #{students.count} great students"
