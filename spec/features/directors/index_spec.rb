require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  it "user can see all directors" do
    dir_1 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL")
    dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA")

    visit "/directors"

    within "#director-#{dir_1.id}" do
      expect(page).to have_content(dir_1.name)
      expect(page).to have_content(dir_1.age)
      expect(page).to have_content(dir_1.city)
    end

    within "#director-#{dir_2.id}" do
      expect(page).to have_content(dir_2.name)
      expect(page).to have_content(dir_2.age)
      expect(page).to have_content(dir_2.city)
    end
  end

  it "user can see episodes for each director" do
    dir_1 = Director.create(name: "Bob Director", age: 50, city: "Chicago, IL")
    dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA")
    eps_1 = dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
    eps_2 = dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
    eps_3 = dir_2.episodes.create(title: "Black Water Bay", viewers: 9)

    visit "/directors"

    within "#director-#{dir_1.id}" do
      expect(page).to have_content(eps_1.title)
      expect(page).to have_content("#{eps_1.viewers} million viewers")
      expect(page).to have_content(eps_2.title)
      expect(page).to have_content("#{eps_2.viewers} million viewers")
    end

    within "#director-#{dir_2.id}" do
      expect(page).to have_content(eps_3.title)
      expect(page).to have_content("#{eps_3.viewers} million viewers")
    end
  end
end
