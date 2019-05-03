require 'rails_helper'

RSpec.describe Director, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    # TO DO: below - change to birth_year and calculate the age
    it {should validate_presence_of :age}
    it {should validate_presence_of :city}

    it {should validate_numericality_of(:age).only_integer}
  end

  describe "relationships" do
    it {should have_many :episodes}
  end

  describe "class methods" do
    before(:each) do
      @dir_1 = Director.create(name: "Bob Director", age: 42, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
      @dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
      @dir_3 = Director.create(name: "Mike McDonald", age: 50, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
      @dir_4 = Director.create(name: "Jacob Em", age: 42, city: "Aaa")
      @eps_1 = @dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
      @eps_2 = @dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
      @eps_3 = @dir_2.episodes.create(title: "Black Water Bay", viewers: 9)
    end

    it "filters directors by age" do
      expect(Director.filter_by_age(42).count).to eq(3)
      expect(Director.filter_by_age(42)).to include(@dir_4)
      expect(Director.filter_by_age(42)).to_not include(@dir_3)

      expect(Director.filter_by_age("zebra").count).to eq(0)
    end

    it "calculates average director age" do
      Director.create(name: "Don't Add Me", age: "zebra", city: "Los Angeles, CA")

      avg_age = ((@dir_1.age + @dir_2.age + @dir_3.age + @dir_4.age).to_f / 4).round(0)

      expect(Director.avg_age).to eq(avg_age)
    end

    it "lists all cities" do
      expect(Director.all_uniq_cities).to eq(["Aaa", "Chicago, IL", "Los Angeles, CA"])
    end
  end

  describe "instance methods" do
    it "gives total episode count" do
      dir_1 = Director.create(name: "Bob Director", age: 42, city: "Chicago, IL", thumbnail: "https://resizing.flixster.com/QznwomaCPPn2qLY4qGQhpkkv95s=/679x605/v1.cjs0MzE2MjtqOzE4MDQ1OzEyMDA7Njc5OzYwNQ")
      dir_2 = Director.create(name: "Susan Blah", age: 42, city: "Los Angeles, CA", thumbnail: "https://thefilmstage.com/wp-content/uploads/2012/02/Brian-Kirk-to-Direct-Thor-2-300x218.jpg")
      dir_3 = Director.create(name: "Mike McDonald", age: 50, city: "Los Angeles, CA", thumbnail: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Alan_Taylor_2013_crop.jpg/440px-Alan_Taylor_2013_crop.jpg")
      eps_1 = dir_1.episodes.create(title: "The Red Wedding", viewers: 10)
      eps_2 = dir_1.episodes.create(title: "Battle of the Bastards", viewers: 12)
      eps_3 = dir_2.episodes.create(title: "Black Water Bay", viewers: 9)

      expect(dir_1.episode_count).to eq(2)
      expect(dir_2.episode_count).to eq(1)
      expect(dir_3.episode_count).to eq(0)
    end
  end
end
