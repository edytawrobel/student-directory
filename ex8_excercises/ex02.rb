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
  puts "The students of Villains Academy"
  puts "-------------"
end


def print(students, letter)
  students.each do |student|
    if student[:name][0].chr == letter
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
puts 'Enter letter you want to sort your students by:'
letter = gets.chomp

#nothing happens until we call the methods
print_header()
puts '----'
print(names, letter)
puts '----'
print_footer(names)
