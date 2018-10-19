def LetterChanges(str)

  #create array to store new word
  new_word_array = Array.new

  #change str to array
  word_array = str.split("")

  index = 0
  while index < word_array.length

    #conditional statement: replace with next letter
    if word_array[index].is_a? String
        new_word_array << word_array[index].next
    #conditional statement: if anything but string, store as is
    else
        new_word_array << word_array[index]
    end
  end

    puts new_word_array

  #check each letter, capitalize if vowel
   index = 0
   while index < new_word_array.length

   if new_word_array[index] == "a"
       new_word_array[index].upcase
    end
  end

    letter_change = new_word_array.join
    puts letter_change

  end

LetterChanges("abc")
