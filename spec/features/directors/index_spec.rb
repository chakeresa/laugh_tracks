require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  describe "main" do
    before(:each) do
      @dir_1 = Director.create(name: "Bob Director", birth_year: 1969, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
      @dir_2 = Director.create(name: "Susan Blah", birth_year: 1977, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
      @dir_3 = Director.create(name: "Mike McDonald", birth_year: 1969, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
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
  end

  describe "when filtering by age" do
    before(:each) do
      Episode.destroy_all
      Director.destroy_all

      @dir_4 = Director.create!(name: "Bob Director", birth_year: 1969, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
      @dir_5 = Director.create!(name: "Susan Blah", birth_year: 1977, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
      @dir_6 = Director.create!(name: "Mike McDonald", birth_year: 1969, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
    end

    it "user can filter to directors with only a spec'd age" do
      visit "/directors?age=50"

      expect(page).to have_content(@dir_4.name)
      expect(page).to_not have_content(@dir_5.name)
      expect(page).to have_content(@dir_6.name)
    end

    it "user can see a message if no directors have spec'd age" do
      visit "/directors?age=11"

      expect(page).to_not have_content(@dir_4.name)
      expect(page).to_not have_content(@dir_5.name)
      expect(page).to_not have_content(@dir_6.name)
      expect(page).to have_content("No directors found with those criteria.")
      expect(page).to have_link("Back to all directors")
    end
  end
end
