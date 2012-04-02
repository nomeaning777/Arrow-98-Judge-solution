loop do
	w, h = gets.split.map(&:to_i)
	map = Array.new(w){Array.new(h,0)}
	cost = Array.new(w){Array.new(h,9999999999999)}
	break if w == 0 && h == 0

	sx, sy, ex, ey = 0, 0, 0, 0
	h.times do |y|
		line = gets.split.map(&:to_i)
		w.times do |x|
			if line[x] == 2
				sx, sy = x, y
			elsif line[x] == 3
				ex, ey = x, y
			else
				map[x][y] = line[x]
			end
		end
	end
	cost[sx][sy] = 0
	que = [[sx, sy, 0]]
	d = [1, 0, -1, 0]
	while que.size > 0
		now = que.shift
		4.times do |i|
			nx = now[0]+d[i]
			ny = now[1]+d[i^1]
			next unless nx >= 0 && nx < w &&
			            ny >= 0 && ny < h
			next unless map[nx][ny] == 0
			if cost[nx][ny] > now[2]+1
				cost[nx][ny] = now[2]+1
				que.push([nx, ny, cost[nx][ny]])
			end
		end
	end
	puts cost[ex][ey]
end
