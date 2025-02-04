class AnalyticsJob < ApplicationJob
  queue_as :default

  def perform
    most_viewed_posts = Post.order(views: :desc).limit(5)
    avg_reading_time = Post.average(:reading_time).to_f
    top_tags = Post.joins(:tags).group('tags.name').order('count(tags.name) DESC').limit(5).count

    Rails.cache.write('most_viewed_posts', most_viewed_posts)
    Rails.cache.write('avg_reading_time', avg_reading_time)
    Rails.cache.write('top_tags', top_tags)
  end
end
