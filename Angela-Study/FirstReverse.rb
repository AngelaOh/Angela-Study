def FirstReverse(str)

  word_array = str.split("")
  index = word_array.length - 1
  reverse_array = []

  while index > -1
    reverse_array << word_array[index]
    index -= 1

  end
  new_string = reverse_array.join

  print new_string

end

FirstReverse("apple")
