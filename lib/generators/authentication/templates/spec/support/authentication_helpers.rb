module AuthenticationHelpers
  def sign_in_as(user)
    post sign_in_path, params: {
      email: user.email,
      password: user.password
    }
  end

  def current_user
    return nil unless cookies.signed[:session_token]

    session = Session.find_by(id: cookies.signed[:session_token])
    session&.user
  end

  def sign_out
    delete sign_out_path
  end

  def expect_response_to_success_or_404
    if respond_to?(:root_path)
      expect(response).to have_http_status(:success)
    else
      expect(response).to have_http_status(:not_found)
    end
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :request
  config.include AuthenticationHelpers, type: :feature
end
