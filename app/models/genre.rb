class Genre < ActiveRecord::Base
  include Sluggable::Instance
  extend Sluggable::Class

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


end
