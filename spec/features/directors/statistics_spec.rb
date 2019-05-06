require 'rails_helper'

RSpec.describe "directors index page statistics", type: :feature do
  before(:each) do
    @dir_1 = Director.create(name: "Bob Director", birth_year: 1977, city: "Chicago, IL")
    @dir_2 = Director.create(name: "Susan Blah", birth_year: 1977, city: "Los Angeles, CA")
    @dir_3 = Director.create(name: "Mike McDonald", birth_year: 1969, city: "Los Angeles, CA")
    @dir_4 = Director.create(name: "Jacob Em", birth_year: 1977, city: "Los Angeles, CA")
    @eps_1 = @dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
    @eps_2 = @dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
    @eps_3 = @dir_3.episodes.create(title: "Black Water Bay", viewers: 9)
  end

  it "user can see average age and list of all cities" do
    visit "/directors"

    within "#statistics" do
      avg_age = ((@dir_1.age + @dir_2.age + @dir_3.age + @dir_4.age).to_f / 4).round(0)

      expect(page).to have_content("Statistics")
      expect(page).to have_content("Average age: #{avg_age}")
      expect(page).to have_content("All cities: Chicago, IL; Los Angeles, CA")
      expect(page).to_not have_content("Los Angeles, CA; Los Angeles, CA")
    end
  end

  it "user can see total episode count" do
    visit "/directors"

    within "#statistics" do
      expect(page).to have_content("Total episode count: #{Episode.count}")
    end
  end

  it "user can see avg viewers per episode" do
    visit "/directors"

    within "#statistics" do
      avg_expected = (@eps_1.viewers + @eps_2.viewers + @eps_3.viewers).to_f / 3
      expect(page).to have_content("Average viewers per episode: #{avg_expected.round(1)} million")
    end
  end

  describe "when filtering by age" do
    it "user can see age and list of all (filtered) cities" do
      visit "/directors?age=#{@dir_1.age}"

      within "#statistics" do
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Average age: #{@dir_1.age}")
        expect(page).to have_content("All cities: Chicago, IL; Los Angeles, CA")
        expect(page).to_not have_content("Los Angeles, CA; Los Angeles, CA")
      end
    end

    it "user can see total episode count" do
      visit "/directors?age=#{@dir_1.age}"

      within "#statistics" do
        expect(page).to have_content("Total episode count: 2")
      end
    end
  end
end
