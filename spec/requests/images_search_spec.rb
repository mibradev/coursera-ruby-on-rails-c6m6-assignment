require 'rails_helper'

RSpec.describe "Images", type: :request do
  include_context "db_cleanup_each"
  let(:account) { signup FactoryGirl.attributes_for(:user) }
  let(:image_resources) { 3.times.map { create_resource images_path, :image } }

  context "search" do
    let!(:user) { login account }
    before(:each) { image_resources }

    it "filters the results" do
      jpost images_search_path, filters: { origin: { lng: -76.6327453, lat: 39.2854217 }, distance: 10, excluding: [1, 4] }
      expect(parsed_body).not_to include("errors")
    end
  end
end
