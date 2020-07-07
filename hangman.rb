$word_list = File.readlines "5desk.txt"
$word = $word_list.sample.downcase.chomp('')
$win = false
$display_arr = []
$disp_fin = "_________
0       |
/\\      |
||      |
        |
        |
    ---------\n\n\n"
$disp_i = "_________
        |
        |
        |
        |
        |
    ---------\n\n\n"
$disp_1 = "_________
0       |
        |
        |
        |
        |
    ---------\n\n\n"
$disp_2 = "_________
0       |
/       |
        |
        |
        |
    ---------\n\n\n"
$disp_3 = "_________
0       |
/\\      |
        |
        |
        |
    ---------\n\n\n"
$disp_4 = "_________
0       |
/\\      |
|       |
        |
        |
    ---------\n\n\n"
$wrong = 0
$wrong_char = ""
class Display
    def initialize()
        word_length = ($word.length) -2
        word_length.times do
            $display_arr.push("_ ")
        end
    end
    def set_display(disp)
        str = ""
        $display_arr.each do |char|
            str += char
        end
        print disp
        puts str
        puts "Incorrect: #{$wrong_char}"
    end
end

class Input
    def guess()
        puts "Guess a letter"
        input = gets.chomp.downcase
        i = 0
        arr = (0 ... $word.length).find_all { |i| $word[i] == input }
        if $word.include?(input)
            arr.each do |val|
                $display_arr[val] = input
            end
        else
            $wrong += 1
            $wrong_char += input
        end
    end
end

class Rules
    def check_win()
        str = ""
        $display_arr.each do |char|
            str = str.to_s
            str.concat(char)
        end
        if $word.eql?(str)
            $win = true
            puts "Congratulations, you won!"
        else
            return
        end
    end
end

class Game
    def initialize()
        d = Display.new
        i = Input.new
        r = Rules.new
        p $word
        while !$win do
            if $display_arr.length != $word.length
                while $display_arr.length < $word.length
                    $display_arr.push("_ ")
                end
            end
            if $wrong == 0
                d.set_display($disp_i)

                i.guess
            elsif $wrong == 1
                d.set_display($disp_1)
                i.guess
            elsif $wrong == 2
                d.set_display($disp_2)
                i.guess
            elsif $wrong == 3
                d.set_display($disp_3)
                i.guess
            elsif $wrong == 4
                d.set_display($disp_4)
                i.guess
            elsif $wrong == 5
                d.set_display($disp_fin)
                puts "The man has died because of you :/"
                return
            end
            r.check_win
        end
    end
    def save()

    end
    def load_game()

    end
end
game = Game.new