class Cinema
  attr_accessor :name, :location

  def initialize(name, location)
    @name = name
    @location = location
    @movies = []
  end

  def add_movie(movie)
    @movies << movie
    movie.cinema = self
  end

  def show_movies()
    puts @movies
  end
end

class Movie
  attr_accessor :title, :showtime, :cinema

  @@all = []

  def initialize(title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end

  def show_all_movies
    puts @@all
  end
end

cobble_hill = Cinema.new("Cobble Hill Cinema", "Court St, Brooklyn")
spider_man_movies = [
  Movie.new("Spider-Man", "6:00"),
  Movie.new("Spider-Man", "8:00"),
  Movie.new("Spider-Man", "10:00"),
  Movie.new("Spider-Man", "12:00"),
  Movie.new("Spider-Man", "14:00"),
]
spider_man = Movie.new("Spider-Man", "9:00")
cobble_hill.add_movie(spider_man)
cobble_hill.add_movie(spider_man_movies[2])
cobble_hill.show_movies