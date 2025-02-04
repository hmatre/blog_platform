require 'rails_helper'

RSpec.describe AnalyticsJob, type: :job do
  let!(:posts) { create_list(:post, 5) }

  it "calculates analytics and stores in cache" do
    expect(Rails.cache).to receive(:write).at_least(:once)
    AnalyticsJob.perform_now
  end
end
