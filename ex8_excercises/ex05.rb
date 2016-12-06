#Our code only works with the student name and cohort. Add more information: hobbies, country of birth, height, etc.
def get_user_input
  properties = Hash.new()
  puts "ENTERING get_user_input"
  puts "Please enter the name of the student"
  properties[:name] = gets.chomp
  puts "Please enter the hobby of the student"
  properties[:hobby] = gets.chomp
  puts "Please enter the country of birth of the student"
  properties[:country] = gets.chomp
  puts "To finish, just hit return twice"
  return properties
end

def input_students
  students = []
  # creating variable properties to reuse it in this scope, it can be called anything
  properties = get_user_input()
  #puts 'NEW PROPERTIES: ', get_user_input()
  # while the name is not empty, repeat this code
  while !properties[:name].empty? && !properties[:hobby].empty? && !properties[:country].empty? do
    # add the student hash to the array
    students << properties
    #length if the array
    puts "Now we have #{students.count} students"
    # get another name from the user
    properties = get_user_input()
  end
  return students
end


def print_header
  puts "The students of Villains Academy are:"
end


def print(students)
  index = 0
  while students.length > index
    student = students[index]
    puts "#{student[:name]} (#{student[:country]}) (#{student[:hobby]})"
    index += 1
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
