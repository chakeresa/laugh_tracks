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
    @director = Director.new
    @failed = params[:failed]
  end

  def create
    director = Director.new(director_params)
    creation_result = director.save
    if creation_result
      redirect_to "/directors"
    else
      redirect_to "/directors/new?failed=true"
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :age, :city)
  end
end
