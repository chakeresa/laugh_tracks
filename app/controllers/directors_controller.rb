class DirectorsController < ApplicationController
  def index
    age = params[:age]
    if age.nil?
      @directors = Director.all
    else
      @directors = Director.filter_by_age(age)
    end
    @director_count = @directors.count
    @director_avg_age = @directors.avg_age
    @all_director_cities = @directors.all_uniq_cities
    @episode_count = @directors.episode_count
  end

  def new
    @director = Director.new
    @failed = params[:failed]
  end

  def create
    director = Director.new(director_params)
    if director.save
      redirect_to "/directors"
    else
      redirect_to "/directors/new?failed=true"
    end
  end

  private

  def director_params
    params.require(:director).permit(:name, :birth_year, :city)
  end
end
