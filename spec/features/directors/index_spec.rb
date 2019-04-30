require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  it "user can see all directors" do
    dir_1 = Director.create(name: xx, age: xx, city: xx)
    dir_1 = Director.create(name: xx, age: xx, city: xx)

    visit "/directors"

    expect(page).to have_content(dir_1.name)
    expect(page).to have_content(dir_1.age)
    expect(page).to have_content(dir_1.city)
    expect(page).to have_content(dir_2.name)
    expect(page).to have_content(dir_2.age)
    expect(page).to have_content(dir_2.city)
  end
end


#   User Story 1
#
# As a visitor
# When I visit `/comedians`
# Then I see a list of comedians with the following
# information for each comedian:
#   * Name
#   * Age
#   * City
#
# - Data does not have to be accurate to real life - you can make this up, or grab the information from the internet.
# - The city attribute can hold birthplace or current known hometown.
# - For testing, you should ensure that the name, age and city only appear on a
#   specific area of the page for that single comedian.