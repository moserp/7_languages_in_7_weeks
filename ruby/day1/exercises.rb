#!/usr/bin/env ruby

puts "Hello, world"

string = "Hello, Ruby"
puts "Index of 'Ruby' in '#{string}' is #{string.index "Ruby"}"

10.times { puts "Joe Bloggs"}

(1..10).each { |i| puts "This is sentence number #{i}" }

number = rand(10)
puts "Guess the number between 1 and 10"
while  true
  case gets.to_i
  when (1...number)
    puts "too low, try again"
  when number
    puts "You got it right!"
    break
  else
    puts "too high, try again"
  end
end
