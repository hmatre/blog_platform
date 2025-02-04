class AdminController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @most_viewed_posts = Rails.cache.read('most_viewed_posts') || []
    @avg_reading_time = Rails.cache.read('avg_reading_time') || 0
    @top_tags = Rails.cache.read('top_tags') || {}
  end
end
