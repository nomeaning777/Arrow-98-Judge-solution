while line = gets
	while line.length > 0
		c = line[0]
		cc = ""
		if line.length > 1
			cc = line[0..1]
		end
		if c == "(" || c == ")"
			puts "PAREN #{c}"
		elsif c == "[" || c == "]"
			puts "BRACK #{c}"
		elsif c == "{" || c == "}"
			puts "BRACE #{c}"
		elsif c == ":" || c == ";" || c== ","
			puts "COLON #{c}"
		elsif c == "'"
			re = /'((\\.)|[^'])*'/ 
			m = re.match(line)
			puts "CHARA #{m[0]}"
			line = line[m[0].length-1..line.length-1]
		elsif c == '"'
			re = /"((\\.)|[^"])*"/ 
			m = re.match(line)
			puts "STRNG #{m[0]}"
			line = line[m[0].length-1..line.length-1]
		elsif /[a-zA-Z_]/ =~ c
			re = /[a-zA-Z_][0-9a-zA-Z_]*/
			m = re.match(line)
			puts "IDENT #{m[0]}"
			line = line[m[0].length-1..line.length-1]
		elsif /[0-9]/ =~ c
			re = /[0-9]+/
			m = re.match(line)
			puts "INTGR #{m[0]}"
			line = line[m[0].length-1..line.length-1]
		elsif c == "#"
			re = /#.*$/
			m = re.match(line)
			puts "PREPR #{m[0]}"
			line = line[m[0].length-1..line.length-1]
		elsif ["++","--","==","!=","||","&&"].index(cc)
			puts "OPR2D #{cc}"
			line = line[1..line.length-1]
		elsif ["+","-","=","!","|","&","*","/"].index(c)
			puts "OPR1D #{c}"
		end
		line = line[1..line.length-1]
	end

end
