require 'logical_model'
module ActivityStream
  class Activity < LogicalModel
    self.attribute_keys = [
        :id,
        :username,
        :account_name,
        :content,
        :generator,
        :verb,
        :data,
        :target_id,
        :target_type,
        :object_id,
        :object_type,
        :created_at,
        :updated_at,
        :public
    ]

    self.hydra = HYDRA
    self.resource_path = "/v0/activities"
    self.use_api_key = true
    self.api_key_name = "app_key"
    self.api_key = API_KEY
    self.host  = HOST

    # Identifies activity as local to your app or not.
    #
    # To identify your app you should define constant: ActivityStream::LOCAL_APP_NAME
    #
    # @return [Boolean]
    def local?
      defined?(LOCAL_APP_NAME) && (generator == LOCAL_APP_NAME)
    end

    def json_root
      'activity'
    end

    attr_accessor :cached_object
    def object
      if !cached_object.present? && local?
        klass = self.object_type.camelize.constantize
        self.cached_object = klass.find(object_id) if klass.exists?(object_id)
      end
      cached_object
    end

    def local_deleted_object?
      local? && object.nil?
    end

    attr_accessor :cached_target
    def target
      if !cached_target.present? && local?
        klass = target_type.camelize.constantize
        self.cached_target = klass.find(target_id) if klass.exists?(target_id)
      end
      cached_target
    end

  end
end
