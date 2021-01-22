# frozen_string_literal: true

require_relative "weather_wear/version"
require 'net/http'
 require 'open-uri'
 require 'json'
 require 'pry'
 require 'uri'

module WeatherWear
  # class Error < StandardError; end
  # Your code goes here...
  
  print('please enter your zip code')
  zip_input = gets() #zip comes from user input

    class GetRequest

      

      URL = "http://api.weatherapi.com/v1/current.json?key=81015c1773c5426092a30651210901&q=" + zip_input

        def initialize(url)
            @url = url
            binding.pry
        end

      
        def get_response_body
          uri = URI.parse(@url)
          response = Net::HTTP.get_response(uri)
          response.body   
        end

        
        def parse_json
          JSON.parse(get_response_body) #converts json returned from get_response_body into data structures.
        end
     end


    class User

          @@all = []
          attr_accessor :name, :zipcode

          def initialize #Each user is initialized with a name and zipcode
            @name = name         
            @@all << self
          end

          def greeting(name)
            puts "Hello #{name}! Please enter your zipcode."
          end

          def enter_info (zipcode)
            # this method needs to take in a zip code, parse through the response body to get temp and conditions for the region.
            # are we iterating through the reponse body, through the array/hashes?
            response.body.each do |location_name, region, temp_f, condition|
              puts "#{location_name}, #{region}, #{temp_f}, #{condition}"
            end
            
            def clothing_recommendation(zipcode)
              #perhaps I need to rerthink this method. I have already called the info needed in the "#enter_info"  method.
              #
              response.body.each do |temp_f, condition|
                if temp_f >= 80 && condition == clear
                  puts "Today is a good day for shorts and a T-shirt!"
                elsif temp_f < 80 || temp_f > 60 && condition == clear
                  puts "Today is a good day for long pants and a lightweight jacket!"
                elsif temp_f < 59 || temp_f > 30 && condition == clear
                  puts "Today is a good day for long pants and a mediumweight jackets!"
                elsif temp_f < 29 || temp_f > 10 && condition == clear
                  puts" Today is a good day for a layers and a heavy coat!"
                elsif temp > 10 || temp_f > 0 && condition == clear 
                  puts " Today is a good day to STAY HOME!"
                elsif temp_f >= 80 && condition == rain
                    puts "Today is a good day for shorts and a T-shirt! Pack a raincoat!"
                  elsif temp_f < 80 || temp_f > 60 && condition == clear
                    puts "Today is a good day for long pants and a lightweight jacket! Pack a raincoat!"
                  elsif temp_f < 59 || temp_f > 30 && condition == clear
                    puts "Today is a good day for long pants and a mediumweight jacket! Pack a raincoat!"
                  elsif temp_f < 29 || temp_f > 10 && condition == clear
                    puts" Today is a good day for a layers and a heavy coat! Pack your umbrella!"
                  elsif temp_f > 10 || temp_f > 0 && condition == snow
                    puts " Today is a good day to STAY HOME!"
                else
                  puts "STAY HOME AND UNDER THE COVERS!"

                end
              end





end
