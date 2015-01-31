  def calculator( first , second , operator )      
    case 
    when operator == "+"
      return first.to_i + second.to_i
    when opertor == "*"
      return first.to_i * second.to_i
    when opertor == "/"
      return first.to_i / second.to_i
    when opertor == "%"
      return first.to_i % second.to_i
    end
  end  

begin
  puts "Enter the first number or C to close"
  c1 = gets.chomp
  if c1=="C" || (c1 != "0" && c1.to_i == 0)
    break
  end

  puts "Enter the operator or C to close"
  o = gets.chomp

  puts "Enter the second number or C to close"
  c2 = gets.chomp
  if c2=="C" || (c2 != "0" && c2.to_i == 0)
    break
  end
  puts "The result is "+calculator(c1,c2,o).to_s
end while c2 != "C"
  
   
    
