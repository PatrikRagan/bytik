class Scrap < ActiveRecord::Base
  has_many :flatscraps
  has_many :flats, through: :flatscraps
  belongs_to :user

  validates :city, presence: true

end
