#Modify your program to only print the students whose name is shorter than 12 characters.

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    #length if the array
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter another name you want to add:"
    name = gets.chomp
  end
  return students
end


def print_header
  puts "The students of Villains Academy whose names are shorter than 12 characters"
end


def print(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Assign the result from input_students to names
names = input_students
puts 'RESULT FROM names: ', names
#nothing happens until we call the methods
print_header()
puts '-' * 7
print(names)
puts '-' * 7
print_footer(names)
