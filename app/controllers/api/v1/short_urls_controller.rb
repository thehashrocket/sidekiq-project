class Api::V1::ShortUrlsController < ApplicationController
  def create
    params[:short_url][:user_id] = current_user.id
    short_url = ShortUrl.create(url_params)
    if short_url.valid?
      render json: { short_url: short_url }
    else
      render json: { error: 'Failed to create short url' }, status: :not_acceptable
    end
  end

  private

  def url_params
    params.require(:short_url).permit(:description, :long_url, :user_id)
  end
end
