answer = []
while line = gets
	line = line.split[0]
	if /^\d+$/ =~ line
		puts answer[line.to_i-1]
	else
		tmp = answer.index(line)
		if tmp
			puts tmp+1
		else
			answer <<= line
			puts answer.size
		end
	end
end
