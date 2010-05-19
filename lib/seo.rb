require 'net/http'
require 'uri'

class Test
	
	require 'modules.rb'
	
	include Download
	include Array_file

	def initialize
		@url = 'http://www.iplists.com/nw/google.txt'
		@file = '../log/apache-combined.log'
		@file_name = 'google.txt'
		create_file(@url, @file_name)
		@array = array_file (@file_name)
	end
	
	def compare
	
		counter = 0
		
		puts "..."
		
		@array.each do |element|
			File.open(@file, 'r+').each { |line|
				if line.include?("#{element}")
					puts ""
					operation(line)
					counter = counter + 1
				end
			
			}
		end
		
		puts "Ergebnisse : " << counter 
	end
	
	def operation (line)
		
		date_regexp = /^.*\[(.*)\/(.*)\/(.{4}):(.*)\].*$/
		ip_regex = /^(.*) - -/
		
		line.match(date_regexp)

		day = $1
		month = $2
		year = $3
		rest = $4
		
		line.match(ip_regex)
		
		ip = $1
		
		puts "Google Bot was Here the #{day} #{month} #{year} at #{rest} on #{ip}" 
		
	end
			
end

b = Test.new
b.compare

counter = 0
line = 0
err = 0

/begin

	while (line = b.file1.gets)
		puts "#{counter}: #{line}"
		counter = counter + 1
	end
	b.file1.close

rescue => err
  puts "Exception: #{err}"
  err
  
end


puts "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"

begin

	while (line = b.file2.gets)
		puts "#{counter}: #{line}"
		counter = counter + 1
	end
	b.file2.close

rescue => err
  puts "Exception: #{err}"
  err
  
end/


	
	
		

