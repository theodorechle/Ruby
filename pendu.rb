require 'set'

def actual_word word, known_letters
    # return a string where not find characters are replaced by "-" except for " " and "-"
    return word.gsub(/[^- #{known_letters.join("|")}#{known_letters.join("|").upcase}]/ , "-")
end


def play
    # get the word to find
    word=""
    until word =~ /^[- [:alpha:]]+$/
        print "Give a word : "
        word=gets.chomp
    end
    system("clear") || system("cls")

    lifes = 5
    find_characters=Set[]
    wrong_characters=Set[]
    
    until lifes == 0
        puts "word to find : "+(actual_word(word, find_characters))
        puts lifes.to_s+" lifes"
        puts "wrong_characters : "+wrong_characters.join("|")
        # get a valid character
        character=""
        until character =~ /^[[:alpha:]]{1}$/
            print "Give a letter : "
            character=gets.chop.downcase
        end
        if word.downcase.include? character
            find_characters << character
        else
            wrong_characters << character
            lifes-=1
        end

        if actual_word(word, find_characters) == word
            puts "You won, the word was "+word
            return
        end
        puts
    end
    puts "You loose, the word was "+word
end

play