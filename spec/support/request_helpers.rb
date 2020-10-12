# frozen_string_literal: true

# Request json helpers
module Request
  # Json helpers module
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body)
    end
  end
end
