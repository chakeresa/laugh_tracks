class DirectorsController < ApplicationController
  def index
    age = params[:age]
    if age.nil?
      @directors = Director.all
    else
      @directors = Director.filter_by_age(age)
    end
  end
end
