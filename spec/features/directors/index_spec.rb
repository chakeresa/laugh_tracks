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
end
