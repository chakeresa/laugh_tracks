require 'rails_helper'

RSpec.describe Director, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    # TO DO: below - change to birth_year and calculate the age
    it {should validate_presence_of :age}
    it {should validate_presence_of :city}
  end

  describe "relationships" do
    it {should have_many :episodes}
  end
end