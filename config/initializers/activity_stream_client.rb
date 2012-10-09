if(defined?(Rails))
  module ActivityStream

    unless defined? HYDRA
      HYDRA = Typhoeus::Hydra.new
    end

    HOST = case Rails.env
      when "production"
       "padma-activity-stream.herokuapp.com"
      when "development"
       "localhost:3003"
      when "test"
       "localhost:3003"
    end
  end
end
