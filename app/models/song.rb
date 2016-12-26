class Song < ActiveRecord::Base   
  include Sluggable::Instance
  extend Sluggable::Class


  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres



end
