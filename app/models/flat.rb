class Flat < ActiveRecord::Base
  has_many :flatscraps,  dependent: :destroy
  has_many :scraps, through: :flatscraps,  dependent: :destroy
  has_many :comments
end
