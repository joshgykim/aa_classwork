# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer

# IMPORTANT:
# For all of the following problems return an ActiveRecord::Association unless
# otherwise specified. 

def star_wars_movies
  # Find the id, title and year of each of the "Star Wars" movies
  Movie.select(:id, :title, :yr).where("title LIKE('Star Wars%')")
end

def stewart_movies
  # Find the id, title, and score of all the movies the actor "Patrick Stewart"
  # was in.
  Movie.joins(:actors).where(actors: {name: 'Patrick Stewart'}).select(:id, :title, :score)

end

def actor_ids_from_grease
  # Return an array (NOT an ActiveRecord:Association) of the `ids` of 
  # all the actors that were in the movie "Grease"
  Actor.joins(:movies).where(movies: {title: 'Grease'}).pluck(:id)
end

def al_pacino_not_number_one
  # Find the id and title of all movies in which Al Pacino
  # appeared but not as a lead actor.

  # Reminder: In the castings table the lead actor for a movie will
  # have an ord = 1

  Movie.joins(:actors).where.not('castings.ord = ?', 1).where(actors: {name: 'Al Pacino'}).select(:id, :title)

end

def smallest_cast
  # Find the id and title of the 3 movies with the
  # smallest casts (i.e least amount of actors)
  Movie.joins(:castings).group(:id).select(:id, :title).order('COUNT(*) ASC').limit(3)

end