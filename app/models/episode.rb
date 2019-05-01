class Episode < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :viewers
end
