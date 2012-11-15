require 'typhoeus'

# == begin app initializer
module ActivityStream
  HYDRA = Typhoeus::Hydra.new
  HOST = "localhost:3003"
  API_KEY = "6dLKSD"
end
# == end app initializer

require 'support/typhoeus_mocks'

include TyphoeusMocks

