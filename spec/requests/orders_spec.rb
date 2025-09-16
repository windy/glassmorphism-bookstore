require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:current_user) { create(:user) }
  before { sign_in_as(current_user) }
 
  describe "GET /orders" do
    it "returns http success" do
      get orders_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /orders/:id" do
    let(:order) { create(:order, customer_email: current_user.email) }

    it "returns http success" do
      get order_path(order)
      expect(response).to have_http_status(:success)
    end
  end
end
