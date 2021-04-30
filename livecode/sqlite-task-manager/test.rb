require "sqlite3"

DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true

require_relative "task"

# TODO: CRUD some tasks

# TEST 1 => READ one task - find(id)
# Successful scenario
task = Task.find(1)
puts "------- #{task.title} #{task.description}"

# Error scenario
############
### This is commented out 'cause we don't want
### the Exception raised (undefined method ...)
### to stop our tests from executing!
# task = Task.find(2000)
# puts "------- #{task.title} #{task.description}"
############

# TEST 2 => CREATE a new task - save
task = Task.new(
  title: "Have beers tonight",
  description: "Online at BeerGarden"
)

task.save
puts "------- #{task.id} - #{task.title} #{task.description}"

# TEST 3 => UPDATE an existing task - save
task.title = "Eat lettuce tonight"
task.description = "at home"

task.save
puts "------- #{task.id} - #{task.title} #{task.description}"

# TEST 4 => READ all tasks - all
Task.all.each do |task|
  puts "------- #{task.id} - #{task.title} #{task.description}"
end

# TEST 5 => DELETE one task - destroy

############
### Be careful with the id provided!
### After we delete the Task with id 1 once,
### we will need to update lines 12, 54 and 57 to use a
### different id from a Task that's still in the DB :D
############

task = Task.find(1)
task.destroy

Task.find(1).title