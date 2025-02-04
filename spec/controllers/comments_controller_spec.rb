require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  before { sign_in user }

  describe "POST #create" do
    it "adds a comment to a post" do
      expect {
        post :create, params: { post_id: post.id, comment: attributes_for(:comment) }
      }.to change(Comment, :count).by(1)
    end
  end
end
