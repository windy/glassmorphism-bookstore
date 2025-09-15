module DevelopmentCsrfBypassConcern
  extend ActiveSupport::Concern

  included do
    if Rails.env.development?
      skip_before_action :verify_authenticity_token, raise: false
    end
  end
end
