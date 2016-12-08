=begin
Continue refactoring the code. Which method is a bit too long?
What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?
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
  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
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
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r").readlines.each { |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym)
  }
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
