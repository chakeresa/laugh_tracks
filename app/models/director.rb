class Director < ApplicationRecord
  has_many :episodes

  validates_presence_of :name
  validates_presence_of :birth_year
  validates_presence_of :city

  validates :birth_year, numericality: { only_integer: true }

  def self.filter_by_age(age)
    birth_year_to_find = Time.now.year - age.to_i
    self.all.where(birth_year: birth_year_to_find.to_i)
  end

  def self.avg_age
    if count == 0
      "N/A"
    else
      Time.now.year - average(:birth_year)
    end
  end

  def self.all_uniq_cities
    pluck(:city).uniq.sort
  end

  def self.episode_count
    joins(:episodes).count
  end

  def self.avg_viewers
    joins(:episodes).average(:viewers)
  end

  def age
    if birth_year.nil?
      nil
    else
      Time.now.year - birth_year
    end
  end

  def episode_count
    episodes.count
  end
end
