require "pry"
@board = Array.new(10).fill(" ")
@player_mark='X'
@computer_mark='0'

@board[0]='-'
def draw_board( )
	system("clear")
	puts " #{@board[1]} "+"|"+" #{@board[2]} "+"|"+" #{@board[3]} "
	puts "===+===+==="
	puts " #{@board[4]} "+"|"+" #{@board[5]} "+"|"+" #{@board[6]} "
	puts "===+===+==="
	puts " #{@board[7]} "+"|"+" #{@board[8]} "+"|"+" #{@board[9]} "
end
draw_board()

def winner?()
	[1,4,7].each do |i|
		return true if @board[i] != ' ' && @board[i] == @board[i+1] && @board[i] == @board[i+2] # Horizontal match
	end
	[1,2,3].each do |i|
		return true if @board[i] != ' ' && @board[i]==@board[i+3] && @board[i]== @board[i+6] # Vertical match
	end
	return true if @board[1] != ' ' && @board[1]==@board[5] && @board[1]== @board[9] # Diagonal match
	return true if @board[3] != ' ' && @board[3]==@board[5] && @board[3]== @board[7] # Diagonal match
	return false
end

def exec_turn(input , isComputer)
	isComputer ? @board[input] = @computer_mark : @board[input] = @player_mark
	draw_board()
	return winner?()
end

def player_win()
	valid_input = false
	puts "Select empty cell from 1 to 9"
	begin
		input = gets.chomp.to_i
		if (input < 1 || input > 9)
			puts "The input should be empty cell between 1 to 9"		
		elsif @board[input] != ' '		
			puts "This cell is already used"		
		else
			valid_input = true
		end
	end while !valid_input
	return exec_turn(input,false)
end

def computer_win()
	begin
		i = rand(9)+1
	end	while @board[i] != ' '
	return exec_turn(i,true)
end

begin
	if player_win()
		puts 'Congrats , you are a winner ' 
		break
	elsif computer_win()	
		puts 'Better luck next time '
		break
	end
end while @board.include?(' ')