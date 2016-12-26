class Artist < ActiveRecord::Base
  include Sluggable::Instance
  extend Sluggable::Class

  has_many :songs
  has_many :genres, through: :songs


end
