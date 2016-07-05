class Flatscrap < ActiveRecord::Base
  belongs_to :flat
  belongs_to :scrap
end
