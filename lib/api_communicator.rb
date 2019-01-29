require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  # Parse THAT web request into a new variable
  response_hash = JSON.parse(response_string)


  # Search through each result of the array inside of response hash
  response_hash["results"].each do |character_hash|

      # if the name is the same as character name passed in, jump to for loop
      if  character_name == character_hash['name'].downcase
        # set up empty film array
        films = []
        # iterate over all of the films
        character_hash["films"].each do |film|
          #gets web request of each film url
          film_string = RestClient.get(film)
          # adds that film name into an array  (after parsed)
          film_hash = JSON.parse(film_string)
          films << film_hash["title"]

        end
        # returns that array with all of the film names
        return films
      end
    end

end

def print_movies(films)
  #passes in films from show_character_movies method
  #
  # sets up iteration for each film
  films.each_with_index do |film, i|
    #print divider
    puts "*********************"
    # since index starts @ 0, each film will start at 1 and step up by 1 with each iteration
    # string interpolation of the film hash at the title level
    puts "#{i+1} #{film}"
  end

    film_array = []
  response_hash["results"].each do |character_hash| #response_hash["results"] is an array

    if character_name == character_hash['name'].downcase

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



