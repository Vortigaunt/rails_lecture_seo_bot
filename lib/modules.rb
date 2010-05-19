module Download

	require 'net/http'
	require 'uri'
	
	def create_file (url, file_name)

		File.new(file_name, 'w+')
		
		url = URI.parse('http://www.iplists.com/nw/google.txt')
		req = Net::HTTP::Get.new(url.path)
		res = Net::HTTP.start(url.host, url.port) {|http|
			File.open(file_name, 'r+') {|f|
				http.request(req) do |str|
					f.write str.body
				end
			}
		}
		
	end
end
	
module Array_file
	
	def array_file (file_name)
	
		user_agent = /^# UA ".*"$/
	
		a = File.open(file_name, 'r+').readlines
		
		size = a.length
		
		for i in 0..size do 
			if a[i].to_s.match(user_agent)
				a[i] = a[i].slice(6..-3)
			end	
		end
		
		return a
	end
	
end
		