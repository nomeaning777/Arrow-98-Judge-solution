def readLine
	d = gets.to_i
	bit = 0
	tmp = d
	while tmp > 0
		bit += (tmp & 1)
		tmp /= 2
	end
	return [-bit, -d]
end

loop do
	n = gets.to_i
	break if n == 0 
	a = Array.new(n)
	n.times do |i|
		a[i] = readLine()
	end
	a.sort!
	a.each do |d|
		puts -d[1]
	end
end
