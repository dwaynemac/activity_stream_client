# wrapper for CRM-Merge API interaction
# Configuration for LogicalModel on /config/initializers/logical_model.rb
module ActivityStream
  class Merge < LogicalModel

    self.hydra = HYDRA
    self.resource_path = "/v0/merges"
    self.attribute_keys = [:parent_id, :son_id]
    self.use_api_key = true
    self.api_key_name = "app_key"
    self.api_key = API_KEY
    self.host  = HOST

    def json_root
      'merge'
    end

  end
end
