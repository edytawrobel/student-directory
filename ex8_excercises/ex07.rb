=begin
In the input_students method the cohort value is hard-coded.
How can you ask for both the name and the cohort?
What if one of the values is empty? Can you supply a default value?
The input will be given to you as a string?
How will you convert it to a symbol? What if the user makes a typo?
=end

def get_user_input
  properties = Hash.new()
  puts "ENTERING get_user_input"
  puts "Please enter the name of the student"
  properties[:name] = gets.chomp
  puts "Please enter the cohort of the student"
  properties[:cohort] = gets.chomp
  puts "Please enter the country of birth of the student"
  properties[:country] = gets.chomp
  puts "To finish, just hit return twice"
  return properties
end

def input_students
  students = []
  # creating variable properties to reuse value returned by get_user_input(), in this scope it can be called anything
  properties = get_user_input()

  #properties[:name] == '' ? properties[:name] = 'N/A' : properties[:name] = properties[:name]
  properties[:cohort] == '' ? properties[:cohort] = ':cohort' : properties[:cohort] = properties[:cohort]
  properties[:country] == '' ? properties[:country] = ':country' : properties[:country] = properties[:country]
  puts 'PROPERTIES: ', properties
  # while the name is not empty, repeat this code
  while !properties[:name].empty? do
    # add the student hash to the array
    #properties[:name] == '' ? properties[:name] = 'N/A' : properties[:name] = properties[:name]
    properties[:cohort] == '' ? properties[:cohort] = ':cohort' : properties[:cohort] = properties[:cohort]
    properties[:country] == '' ? properties[:country] = ':country' : properties[:country] = properties[:country]
    students << properties
    #length of the array
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
    puts "#{student[:name]}; #{student[:cohort]}; #{student[:country]}"
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
