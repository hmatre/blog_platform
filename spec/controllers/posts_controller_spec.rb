require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "increments post views" do
      expect { get :show, params: { id: post.id } }.to change { post.reload.views }.by(1)
    end
  end

  describe "POST #create" do
    before { sign_in user }

    it "creates a new post" do
      expect {
        post :create, params: { post: attributes_for(:post) }
      }.to change(Post, :count).by(1)
    end
  end
end
