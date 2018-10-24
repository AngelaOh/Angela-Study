# check if string is a palindrome

def PalindromeCheck(str)

  # word_array = str.split("")
  # new_word_array = Array.new
  # tracker = word_array.length - 1
  #
  # until tracker < 0
  #   new_word_array << word_array[tracker]
  #   tracker -= 1
  # end
  #
  # print word_array
  # print new_word_array
  #
  # if word_array == new_word_array
  #   puts true
  # else
  #   puts false
  # end

check_palindrome = str.reverse

if str == check_palindrome
  print true
else
  print false
end



end

PalindromeCheck("asc")
