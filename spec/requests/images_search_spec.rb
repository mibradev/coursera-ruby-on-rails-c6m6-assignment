require 'rails_helper'

RSpec.describe "Images", type: :request do
  include_context "db_cleanup_each"
  let(:account) { signup FactoryGirl.attributes_for(:user) }
  let(:image_resources) { 5.times.map { create_resource images_path, :image } }

  context "search" do
    let!(:user) { login account }
    before(:each) { image_resources }

    it "filters the results" do
      jpost images_search_path, filters: { origin: { lng: 76, lat: 39 }, distance: 10, excluding: [1, 4] }
      expect(parsed_body.size).to eq(3)
    end
  end
end
