def get_user_input
  properties = {}
  puts "ENTERING get_user_input"

  # Name
  puts "Please enter the name of the student"
  properties[:name] = gets.slice(0..-2)

  # Cohort
  puts "Please enter the cohort of the student"
  properties[:cohort] = gets.chomp

  # Country
  puts "Please enter the country of birth of the student"
  puts "To finish, just hit return twice"
  properties[:country] = gets.chomp

  #validation - ternary operator
  properties[:cohort] == '' ? properties[:cohort] = ':cohort' : properties[:cohort] = properties[:cohort]
  properties[:country] == '' ? properties[:country] = ':country' : properties[:country] = properties[:country]

  return properties
end

def input_students
  students = []
  properties = get_user_input()
  grouped = {}

  index = 0
  while !properties[:name].empty? do
    students << properties

    if (!grouped[students[index][:cohort]])
      grouped[students[index][:cohort]] = [].push(students[index])
    else
      grouped[students[index][:cohort]].push(students[index])
    end
    puts '----------------'
    # (students.count == 1) ? puts "Now we have #{students.count} student" : puts "Now we have #{students.count} students"

    if students.count == 1 && grouped.count == 1
      puts "Now we have #{students.count} student"
      puts "We have #{grouped.count} group"
    else
      puts "Now we have #{students.count} students"
      puts "We have #{grouped.count} groups"
    end

    puts '----------------'

    properties = get_user_input()
    index += 1
  end
  return students
end


def print_header
  puts "The students of Villains Academy are:"
end


def print(students)
  index = 0
  if students.length > 0
    while students.length > index
      student = students[index]
      puts "#{student[:name]}; #{student[:cohort]}; #{student[:country]}"
      index += 1
    end
  else
    puts 'Please make sure to enter the student'
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
