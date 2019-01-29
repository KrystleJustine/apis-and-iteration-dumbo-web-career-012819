require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

    film_array = []
  response_hash["results"].each do |character_hash| #response_hash["results"] is an array

    if character_name == character_hash['name']

     character_hash["films"].each do |film|
       film_string = RestClient.get(film)
       films = JSON.parse(film_string)

       film_array << films
         # puts film["title"]
      end
    end
  end
  film_array
end

 def print_movies(films)

   # puts films["title"]
   films.each_with_index do |film, i|
   puts "#{i +1} #{film["title"]}"
   # binding.pry
# #   # some iteration magic and puts out the movies in a nice list
end
 end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

character_name = "Luke Skywalker"
show_character_movies(character_name)
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
