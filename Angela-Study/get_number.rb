puts "Welcome to the Number Guessing Game! You have 10 tries to guess the magic number between 1 and 100."
puts "To start, please enter your name: "

user_name = gets.chomp
user_name.to_i
rand_num = rand(100)
num_of_guesses = 1

puts "Okay, we have chosen a number between 1 and 100. Please enter your first guess: "
user_guess = gets.chomp.to_i
print rand_num

until user_guess == rand_num || 10 - num_of_guesses == 0
  if user_guess < rand_num
    puts "Not quite! Your number is too low. You have #{10-num_of_guesses} tries left. Try again: "
    user_guess = gets.chomp.to_i
    num_of_guesses += 1
  elsif user_guess > rand_num
    puts "Not quite! Your number is too high. You have #{10-num_of_guesses} tries left. Try again:"
    user_guess = gets.chomp.to_i
    num_of_guesses += 1
  end
end

if  10 - num_of_guesses == 0
  puts "Game over. You have used up all 10 tries."
else
  puts "#{user_name}, You got it! It took you #{num_of_guesses} tries."
end
