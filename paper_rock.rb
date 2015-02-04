winning_combo = {[0,1]=>"wraps", [1,2]=>"breaks" ,  [2,0] => "cuts"}
valid_input = ['p','r','s','Q']
begin
  option_selection = ["Paper", "Rock", "Scissor"]
  begin
    puts "Pick one of p/r/s or Q to QUIT"
    i = gets.chomp
  end while valid_input.index(i) == nil
  break if i == "Q"
  c = rand(2)  
  user_i , comp_i = valid_input.index(i), c
  puts "\033[1A \033[1C \033[K \033[5D#{option_selection[user_i]}"
  print "Computer is thinking ... " 
  ("|/--\\" * rand(2)).chars.each {|c| print c; sleep (rand(10)*0.1); print "\b"}
  print "\b"*17 +" selected #{option_selection[comp_i]}    "
  print "\n***"
  if (user_i == comp_i)
    puts "We think alike ! Its a draw"
  elsif(winning_combo.has_key?([user_i, comp_i]))
    puts "You win as #{option_selection[user_i]} #{winning_combo.fetch([user_i,comp_i])} #{option_selection[comp_i]}"
  elsif(winning_combo.has_key?([comp_i, user_i]))
    puts "Computer wins as #{option_selection[comp_i]} #{winning_combo.fetch([comp_i,user_i])} #{option_selection[user_i]}"
  else
    puts"Seriously confused"
  end
  begin
    puts "Do you want to play again (Y/N)??? "
    i = gets.chomp
  end while ["Y","N"].index(i) == nil
end  while i == "Y"


  
