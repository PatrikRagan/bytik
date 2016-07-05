class Comment < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user
end
