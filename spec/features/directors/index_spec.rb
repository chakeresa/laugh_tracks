require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  before(:each) do
    @dir_1 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
    @dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
    @eps_1 = @dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
    @eps_2 = @dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
    @eps_3 = @dir_2.episodes.create(title: "Black Water Bay", viewers: 9)
  end

  it "user can see all directors" do
    visit "/directors"

    within "#director-#{@dir_1.id}" do
      expect(page).to have_content(@dir_1.name)
      expect(page).to have_content(@dir_1.age)
      expect(page).to have_content(@dir_1.city)
    end

    within "#director-#{@dir_2.id}" do
      expect(page).to have_content(@dir_2.name)
      expect(page).to have_content(@dir_2.age)
      expect(page).to have_content(@dir_2.city)
    end
  end

  it "user can see episodes for each director" do
    visit "/directors"

    within "#director-#{@dir_1.id}" do
      expect(page).to have_content(@eps_1.title)
      expect(page).to have_content("#{@eps_1.viewers} million viewers")
      expect(page).to have_content(@eps_2.title)
      expect(page).to have_content("#{@eps_2.viewers} million viewers")
    end

    within "#director-#{@dir_2.id}" do
      expect(page).to have_content(@eps_3.title)
      expect(page).to have_content("#{@eps_3.viewers} million viewers")
    end
  end

  it "user can see thumbnail for each director" do
    visit "/directors"

    within "#director-#{@dir_1.id}" do
      expect(page).to have_xpath("//img[@src='#{dir_1.thumbnail}']")
    end

    within "#director-#{@dir_2.id}" do
      expect(page).to have_xpath("//img[@src='#{dir_2.thumbnail}']")
    end

    #     User Story 3
    #
    # As a visitor
    # When I visit `/comedians`
    # I see a thumbnail image for each comedian
    #
    # - Image locations (URLs) can be stored in the database as a string.
    # - Use the image URLs from IMDB or other online source for the special
    # - Use CSS styling to scale the image smaller if needed to fit on the page
  end
end
