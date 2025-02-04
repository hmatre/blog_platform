require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:comments).dependent(:destroy) }
  
  it "calculates reading time before creation" do
    post = build(:post, body: "word " * 600)
    post.save
    expect(post.reading_time).to eq(3) # 600 words / 200 words per minute
  end
end
