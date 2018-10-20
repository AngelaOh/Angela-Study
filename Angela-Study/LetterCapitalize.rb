def LetterCapitalize(str)

# turn string to array
str_array = str.split("")

# create new array to store each word
storage_array = []

# create super storage array
super_array = []

# iterate through initial array
index = 0
while index < str_array.length
    # store each letter until it hits a space
    if str_array[index] == " "
        super_array << storage_array
        storage_array = []
    # if its a space, push single word into new storage array
  elsif str_array[index] != " "
        storage_array << str_array[index]
    end
index += 1
end

# capitalize first index of each array in storage array
index = 0
while index < super_array.length
    super_array[index][0].capitalize!
    index += 1
end

storage_array[0].capitalize!

# add space at end of each word minus the last
index = 0
while index < super_array.length
  super_array[index].push(" ")
  index += 1
end

# flatten array
super_array << storage_array
super_array.flatten

# join array to string

new_word = super_array.join

# print string
print new_word

end

# keep this function call here
LetterCapitalize("Hello my name is angela")
