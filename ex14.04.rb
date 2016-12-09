=begin
Right now, when the user choses an option from our menu, there's no way of them knowing if the action was successful.
Can you fix this and implement feedback messages for the user?
=end

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  count = 0
  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    count += 1
    # get another name from the user
    name = STDIN.gets.chomp
  end
  puts "You added #{count} students successfully"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each { |student|
    file.puts "#{student[:name]}, #{student[:cohort]}"
  }
  puts "Successfully saved to #{File.basename(file)}" #Returns the last component of the filename given in file_name
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |f| #the block paramter receives the File object
    #the while test succeeds as long as lines are coming in from the file
    while record = f.gets #inside the block the file is read one line at a time using f
      name, cohort = record.chomp.split(',')
      #when the program hits the end the input file, gets return nil, and the while condition fails
    add_students(name, cohort.to_sym)
    end
  end
  puts "Successfully loaded from #{filename}" #Returns the last component of the filename given in file_name
end


def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students("students.csv")
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} entries from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    Exit # quit the program
  end
end

try_load_students
interactive_menu
