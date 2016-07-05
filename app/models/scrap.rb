class Scrap < ActiveRecord::Base
  has_many :flatscraps,  dependent: :destroy
  has_many :flats, through: :flatscraps, dependent: :destroy
  belongs_to :user

  validates :city, presence: true

end
