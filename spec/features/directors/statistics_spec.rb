require 'rails_helper'

RSpec.describe "directors index page statistics", type: :feature do
  before(:each) do
    @dir_1 = Director.create(name: "Bob Director", age: 42, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
    @dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
    @dir_3 = Director.create(name: "Mike McDonald", age: 50, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
    @dir_4 = Director.create(name: "Jacob Em", age: 42, city: "Los Angeles, CA")
    @eps_1 = @dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
    @eps_2 = @dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
    @eps_3 = @dir_2.episodes.create(title: "Black Water Bay", viewers: 9)
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

  describe "when filtering by age" do
    it "user can see age and list of all (filtered) cities" do
      visit "/directors?age=42"

      within "#statistics" do
        expect(page).to have_content("Statistics")
        expect(page).to have_content("Average age: 42")
        expect(page).to have_content("All cities: Chicago, IL; Los Angeles, CA")
        expect(page).to_not have_content("Los Angeles, CA; Los Angeles, CA")
      end
    end
  end
end
