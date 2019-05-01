class Episode < ApplicationRecord
  belongs_to :director

  validates_presence_of :title
  validates_presence_of :viewers
end
