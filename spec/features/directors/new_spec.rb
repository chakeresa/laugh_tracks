require 'rails_helper'

RSpec.describe "directors new page", type: :feature do
  it "user can create a new director" do
    visit "/directors/new"
    fill_in "Name", with: "Bob"
    fill_in "Age", with: 34
    fill_in "City", with: "Hobbiton"
    click_on "Create Director"

    new_director = Director.last

    expect(current_path).to eq("/directors")
    expect(page).to have_content("Bob")
    expect(page).to have_content(34)
    expect(page).to have_content("Hobbiton")
  end

  it "new director page reloads if invalid input" do
    visit "/directors/new"
    fill_in "Name", with: "Bob"
    fill_in "Age", with: 34
    click_on "Create Director"

    new_director = Director.last

    expect(current_path).to eq("/directors/new")
    expect(page).to have_content("Failed to create new director. Try again.")
  end
end