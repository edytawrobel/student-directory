def get_user_input
  properties = {}
  puts "ENTERING get_user_input"

  # Name
  puts "Please enter the name of the student"
  properties[:name] = gets.chomp

  # Cohort
  puts "Please enter the cohort of the student"
  properties[:cohort] = gets.chomp

  # Country
  puts "Please enter the country of birth of the student"
  puts "To finish, just hit return twice"
  properties[:country] = gets.chomp

  properties[:cohort] == '' ? properties[:cohort] = ':cohort' : properties[:cohort] = properties[:cohort]
  properties[:country] == '' ? properties[:country] = ':country' : properties[:country] = properties[:country]

  return properties
end

def input_students
  students = []
  properties = get_user_input()
  grouped = {} # grouped is used for the sorting of cohorts

  # while the name is not empty, repeat this code
  index = 0
  while !properties[:name].empty? do
    # validate(properties)
    students << properties

    # Group students by cohorts
    #if cohort does not exist
    if (!grouped[students[index][:cohort]])
      #create cohort and add it onto array
      grouped[students[index][:cohort]] = [].push(students[index])
    else
      #if it does exist, push it into array
      grouped[students[index][:cohort]].push(students[index])
    end
    puts '----------------'
    puts "We have #{grouped.count} groups"
    puts "Now we have #{students.count} students"
    puts '----------------'
    # get another name from the user
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
