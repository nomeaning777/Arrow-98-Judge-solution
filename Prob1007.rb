loop do
	n, c = gets.split.map(&:to_i)
	break if n == 0
	h = Array.new(n)
	d = Array.new(n)

	n.times do |i|
		h[i], d[i] = gets.split.map(&:to_i)
	end
	dp = Array.new(c+1, 0)
	n.times do |i|
		c.downto(0) do |j|
			next if j + d[i] > c
			dp[j + d[i]] = [dp[j + d[i]], dp[j] + h[i]].max
		end
	end
	puts dp[c]
end
