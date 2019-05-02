require 'rails_helper'

RSpec.describe "directors index page statistics", type: :feature do
  before(:each) do
    @dir_1 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
    @dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
    @dir_3 = Director.create(name: "Mike McDonald", age: 30, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
    @eps_1 = @dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
    @eps_2 = @dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
    @eps_3 = @dir_2.episodes.create(title: "Black Water Bay", viewers: 9)
  end

  it "user can see all directors" do
    visit "/directors"

    within "#statistics" do
      expect(page).to have_content("Statistics")
      expect(page).to have_content("Average age: 41")
    end

    # In that 'Statistics' area, I see the following information:
    # - the average age of all comedians on the page (if the page is filtered for specific comedians, the statistics should reflect the new group)
    # - a unique list of cities for each comedian on the page
    #
    # Averaging and uniqueness should be done in ActiveRecord NOT
    # using Ruby
  end

  # User Story 8
  #
  # As a visitor
  # When I visit `/comedians?age=34`
  # Then I see a list of all comedians with an age of 34
  # Just like a previous User Story, BUT all other statistics
  # information in the 'Statistics' area of the page should be limited
  # to reflect only the information about the comedians listed on
  # the page.
  #
  # - Testing should ensure that calculated statistics are
  #   correct for a limited subset of data
end
