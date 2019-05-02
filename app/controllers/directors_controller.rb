class DirectorsController < ApplicationController
  def index
    age = params[:age]
    if age.nil?
      @directors = Director.all
    else
      @directors = Director.filter_by_age(age)
    end
  end

  def new
  end

  def create
    director = Director.new(director_params)
    # TO DO: add if below to throw error if unsuccessful
    director.save

    redirect_to "/directors"
  end

  private

  def director_params
    params.require(:director).permit(:name, :age, :city)
  end
end
