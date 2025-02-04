class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :post_tags
  has_many :tags, through: :post_tags
  acts_as_taggable_on :tags
  
  before_create :calculate_reading_time

  private
  
  def calculate_reading_time
    words_per_minute = 200
    word_count = body.split.size
    self.reading_time = (word_count / words_per_minute.to_f).ceil
  end
end
