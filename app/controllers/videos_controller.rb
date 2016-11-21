class VideosController < ApplicationController

  def show
    q = params[:id].gsub(/\+/, " ") + " shooting"
    response = HTTParty.get(base_uri + q)
    ids = response["items"].map do |item|
      item["id"]["videoId"]
    end
    render json: {
      videoIds: ids,
      id: params[:resourceId]
    }
  end

  private

    def base_uri
      "https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&key=" + ENV["YOUTUBE_API_KEY"] + "&q="
    end

end
