loop do
	a, b = gets.split
	a = a.to_i(16)
	b = b.to_i(16)

	break if a==0 && b==0
	puts (a+b).to_s
end
