class PeopleController < ApplicationController

  def index
    build_query(params)
    people = Person.where(@query).order(@order)
    render json: people
  end

  private

  def build_query(params)
    return nil if !params || params.keys.length == 0
    @query = {}
    params.each do |key, value|
      @query[key] = value if validQuery?(key)
    end
    if params[:date_min] || params[:date_max]
      @query[:date] = ( (params[:date_min] || Time.new(2000))..(params[:date_max] || Time.now) )
    end
    if params[:age_min] || params[:age_max]
      @query[:age] = ( (params[:age_min] ? params[:age_min].to_i : 0)..(params[:age_max] ? params[:age_max].to_i : 1000) )
    end
    @order = validQuery?(params[:order]) ? params[:order] : ''
  end

  def validQuery?(key)
     valid = ['name', 'age', 'gender', 'race', 'image_url', 'date', 'street', 'city', 'state', 'zip', 'county', 'agency', 'cause', 'disposition', 'charges', 'link_url', 'mental_illness', 'armed']
     valid.include?(key)
  end

end
