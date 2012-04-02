Tokenizer = [[/^[()]/, "PAREN"], [/^[\[\]]/, "BRACK"], [/^[\{\}]/m, "BRACE"],
             [/^[:;,]/, "COLON"], [/^'((\\.)|[^'])*'/, "CHARA"], [/^"((\\.)|[^"])*"/, "STRNG"],
			 [/^[a-zA-Z_][0-9a-zA-Z_]*/, "IDENT"], [/^[0-9]+/, "INTGR"], [/^#.*$/, "PREPR"],
			 [/^(\+\+|--|==|!=|\|\||&&)/, "OPR2D"], [/^[\+-=!\|&\*\/]/ ,"OPR1D"]]
while line = gets
	while line.length > 0
		any_match = nil
		Tokenizer.each do |token|
			if token[0] =~ line
				m = token[0].match(line)
				puts "#{token[1]} #{m[0]}"
				line=line[m[0].length-1..line.length-1]
				break
			end
		end
		line=line[1..line.length-1]
	end
end
