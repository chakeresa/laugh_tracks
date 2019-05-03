class Director < ApplicationRecord
  has_many :episodes

  validates_presence_of :name
  # TO DO: below - change to birth_year and calculate the age
  validates_presence_of :age
  validates_presence_of :city

  def self.filter_by_age(age)
    self.all.where(age: age.to_i)
  end

  def self.avg_age
    average(:age)
  end

  def self.all_uniq_cities
    distinct.pluck(:city).sort
  end

  def episode_count
    episodes.count
  end
end
