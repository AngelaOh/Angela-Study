## First Try: longer version
# def LetterCapitalize(str)
#
# # turn string to array
# str_array = str.split("")
#
# # create new array to store each word
# storage_array = []
#
# # create super storage array
# super_array = []
#
# # iterate through initial array
# index = 0
# while index < str_array.length
#     # store each letter until it hits a space
#     if str_array[index] == " "
#         super_array << storage_array
#         storage_array = []
#     # if its a space, push single word into new storage array
#   elsif str_array[index] != " "
#         storage_array << str_array[index]
#     end
# index += 1
# end
#
# # capitalize first index of each array in storage array
# index = 0
# while index < super_array.length
#     super_array[index][0].capitalize!
#     index += 1
# end
#
# storage_array[0].capitalize!
#
# # add space at end of each word minus the last
# index = 0
# while index < super_array.length
#   super_array[index].push(" ")
#   index += 1
# end
#
# # flatten array
# super_array << storage_array
# super_array.flatten
#
# # join array to string
#
# new_word = super_array.join
#
# # print string
# print new_word
#
# end
#
# # keep this function call here
# LetterCapitalize("Hello my name is angela")


## Second Try: more efficient

def LetterCapitalize(str)

  #1 split the words into an array
  #2 loop through the array
  #3 capitalize every first letter
  #4 join and return new str

  words = str.split(' ')

  (0..words.length-1).each do |i|
     words[i][0] = words[i][0].upcase
  end

  string = words.join(" ")

  print string

end

LetterCapitalize("Hello my name is angela")
