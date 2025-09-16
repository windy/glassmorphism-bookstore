require 'rails_helper'

RSpec.describe "Books", type: :request do
    # Uncomment this if controller need authentication
  # before { sign_in_as(create(:user)) }
  
  describe "GET /books" do
    it "returns http success" do
      get books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /books/:id" do
    let(:book) { create(:book) }

    it "returns http success" do
      get book_path(book)
      expect(response).to have_http_status(:success)
    end
  end
end
