loop do
	c, l = gets.split.map(&:to_i)
	n = gets.to_i
	break if c==0 && l==0 && n==0
	s = Array.new(n)
	t = Array.new(n)
	n.times do |i|
		s[i], t[i] = gets.split.map(&:to_i)
	end
	ans = 9999999999999
	(1<<n).times do |bit|
		time, money = 0, 0
		n.times do |i|
			if ((bit>>i) & 1) == 1
				time += t[i]
				money += (s[i]-l)*100
			end
		end
		ans = [ans,time].min if money >= c
	end
	puts ans
end
