loop do
	a,n,d = gets.split.map(&:to_i)
	break if a==0 && n==0 && d==0
	n.times do |i|
		print " " if i>0
		print a
		a+=d
	end
	puts
end
