# Arrow98's Judge Projectに回答を送信します
# 引数として問題番号を与えてください
# 回答ファイルは問題番号.out.txtというファイル名にしてください

USER_NAME = "nomeaning"
SUBMIT = "http://judge.arnip.org/judge.cgi"

require 'net/http'
require 'uri'

if ARGV.length == 0
	puts "usage: ruby submit.rb Problem_ID"
	exit
end
prob = ARGV[0]
p prob
uri =URI.parse(SUBMIT)
net_http = Net::HTTP
if ENV['HTTP_PROXY']
	net_http = Net::HTTP::Proxy("proxy-east.uec.ac.jp","8080")
end
net_http.start(uri.host, uri.port) do |http|
	request = Net::HTTP::Post.new(uri.path)

	request.set_content_type("multipart/form-data; boundary=zzz")
	body = ""
	body.concat("--zzz\r\n")
	body.concat("content-disposition: form-data; name=\"id\";\r\n")
	body.concat("\r\n")
	body.concat("#{prob}\r\n")

	body.concat("--zzz\r\n")
	body.concat("content-disposition: form-data; name=\"name\";\r\n")
	body.concat("\r\n")
	body.concat("#{USER_NAME}\r\n")


	body.concat("--zzz\r\n")
	body.concat("content-disposition: form-data; name=\"file\"; filename=\"output.txt\"\r\n")
	
	body.concat("\r\n")
	File::open(prob+".out.txt"){|f| body.concat(f.read + "\r\n")  }
	
	body.concat("--zzz--\r\n")
	request.body = body

	response = http.request(request)
end
