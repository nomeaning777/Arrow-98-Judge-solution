loop do
	break if 0 == (n = gets.to_i)
	input = []
	n.times do
		input <<= gets.split
	end
	n.times do
		(n-1).times do |i|
			if input[i][1].to_i < input[i+1][1].to_i 
				input[i] ,input[i+1] = input[i+1],input[1]
			end
		end
	end
	puts input[0][0]
end
	
