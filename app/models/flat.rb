class Flat < ActiveRecord::Base
  has_many :flatscraps
  has_many :scraps, through: :flatscraps
  has_many :comments
end
