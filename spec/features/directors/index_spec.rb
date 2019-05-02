require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  before(:each) do
    @dir_1 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
    @dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
    @dir_3 = Director.create(name: "Mike McDonald", age: 50, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
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
      expect(page).to have_xpath("//img[@src='#{@dir_1.thumbnail}']")
    end

    within "#director-#{@dir_2.id}" do
      expect(page).to have_xpath("//img[@src='#{@dir_2.thumbnail}']")
    end
  end

  it "user can see episode count for each director" do
    dir_4 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
    dir_5 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
    dir_6 = Director.create(name: "Mike McDonald", age: 50, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")

    visit "/directors?age=50"

    expect(page).to have_content(dir_4.name)
    expect(page).to_not have_content(dir_5.name)
    expect(page).to have_content(dir_6.name)
  end

  it "user can see episode count for each director" do
    visit "/directors"

    within "#director-#{@dir_1.id}" do
      expect(page).to have_content("Episodes (#{@dir_1.episodes.count}):")
    end

    within "#director-#{@dir_2.id}" do
      expect(page).to have_content("Episodes (#{@dir_2.episodes.count}):")
    end

    within "#director-#{@dir_3.id}" do
      expect(page).to have_no_content("Episodes")
    end
  end

  # User Story 6
  #
  # As a visitor
  # When I visit `/comedians/new`
  # Then I see a form to input a new comedian into the database
  # Including fields for their name, age and city.
  # When the form is successfully submitted and saved,
  # Then I am redirected to `/comedians`
  # And I see the new comedian's data on the page.


  # User Story 7
  #
  # As a visitor
  # When I visit `/comedians`
  # Then I see an area at the top of the page called 'Statistics'
  # In that 'Statistics' area, I see the following information:
  # - the average age of all comedians on the page (if the page is filtered for specific comedians, the statistics should reflect the new group)
  # - a unique list of cities for each comedian on the page
  #
  # Averaging and uniqueness should be done in ActiveRecord NOT
  # using Ruby


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
