class ShortUrlsController < ApplicationController
  skip_before_action :authorized, only: [:short_url]

  def short_url
    short_url = ShortUrl.find_by_short_url(params[:short_url])
    if short_url.valid?
      render json: { short_url: short_url.short_url }
    else
      render json: { error: 'Failed to find short url' }, status: :not_acceptable
    end
  end
end
