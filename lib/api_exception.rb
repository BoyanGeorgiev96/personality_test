# = ApiException
# This module centralizes handling of pre-defined exceptions
#
module ApiException
  # = EXCEPTIONS
  # You can define your own exception on here.
  #
  EXCEPTIONS = {
    # 400
    'ActiveRecord::RecordInvalid' => { status: 400, error_code: 400_01, message: 'Invalid request' },
    'BadRequest' => { status: 400, error_code: 400_02, message: 'Bad request' },

    # 401
    'Unauthorized' => { status: 401, error_code: 401_01, message: 'You need to login first. Visit /api/v1/login' },

    # 403
    'Forbidden' => { status: 403, error_code: 403_01, message: 'Your own message in here' },

    # 404
    'ActiveRecord::RecordNotFound' => { status: 404, error_code: 404_01, message: 'Cannot find record' },
    'NotFound' => { status: 404, error_code: 404_02, message: 'Your own message in here' }
  }.freeze

  # Default to BaseError if exception is not in EXCEPTIONS
  class BaseError < StandardError
    def initialize(msg = nil)
      super
      @message = msg
    end

    def message
      @message || nil
    end
  end

  # Rescue exceptions and render error JSON
  module Handler
    def self.included(klass)
      klass.class_eval do
        EXCEPTIONS.each do |exception_name, context|
          unless ApiException.const_defined?(exception_name)
            ApiException.const_set(exception_name, Class.new(BaseError))
            exception_name = "ApiException::#{exception_name}"
          end

          rescue_from exception_name do |exception|
            render status: context[:status], json: {
              error_code: context[:error_code],
              message: context[:message],
              detail: exception.message
            }.compact
          end
        end
      end
    end
  end
end
