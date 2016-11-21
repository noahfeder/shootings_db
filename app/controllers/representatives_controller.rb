class RepresentativesController < ApplicationController
  def show
    zip = params[:id]
    response = HTTParty.get(base_uri + zip)
    render json: response
  end

  private

    def base_uri
      "http://whoismyrepresentative.com/getall_mems.php?output=json&zip="
    end
end
