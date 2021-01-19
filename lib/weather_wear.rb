# frozen_string_literal: true
require 'pry'
require_relative "weather_wear/version"
require 'net/http'
 require 'open-uri'
 require 'json'
 require 'pry'

module WeatherWear
  # class Error < StandardError; end
  # Your code goes here...

    class GetRequest

      URL = http://api.weatherapi.com/v1/current.json

        def initialize(url)
            @url = url
        end

      
        def get_response_body
          uri = URI.parse(@url)
          response = Net::HTTP.get_response(uri)
          response.body   
        end

        
        def parse_json
          JSON.parse(get_response_body) #converts json returned from get_response_body into data structures.
        end


    class User

          @@all = []
          attr_accessor :name, :zipcode

          def initialize #Each user is initialized with a name and zipcode
            @name = name
            @zipcode = zipcode
            @@all << self
          end



end
