=begin
We are opening and closing the files manually. Read the documentation of the File class to find out
how to use a code block (do...end) to access a file, so that we don't have to close it explicitly
(it will be closed automatically when the block finishes).
Refactor the code to use a code block.
=end

#done in the previous refactoring ex.3

@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
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
  when "3"
    save_students(choose_file)
  when "4"
    load_students(choose_file)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def choose_file
  puts "Enter the filename you want to use"
  file = STDIN.gets.chomp
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

def save_students(filename)
  File.open(filename, "w") { |file|
    $students.each do |student|
      file.puts "#{student[:name]}, #{student[:cohort]}"
    end
  }
  puts "Successfully saved" #Returns the last component of the filename given in file_name
end

def load_students(filename = "students.csv")
  File.open(filename) do |f|
    while record = f.gets
      name, cohort = record.chomp.split(',')
    add_students(name, cohort.to_sym)
    end
  end
  puts "Successfully loaded from #{filename}"
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
    exit # quit the program
  end
end

try_load_students
interactive_menu
