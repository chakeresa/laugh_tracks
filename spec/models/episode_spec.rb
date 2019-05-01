require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :viewers}
  end
end