module CloudConnect
  class Message
    attr_accessor :asset,
                  :id,
                  :id_str,
                  :parent_id,
                  :parent_id_str,
                  :thread_id,
                  :thread_id_str,
                  :channel,
                  :type,
                  :sender,
                  :recipient,
                  :length,
                  :b64_payload,
                  :recorded_at,
                  :created_at,
                  :url

    def initialize(payload)
      @asset = payload['asset']
      @id = payload['id']
      @id_str = payload['id_str']
      @parent_id = payload['parent_id']
      @parent_id_str = payload['parent_id_str']
      @thread_id = payload['thread_id']
      @thread_id_str = payload['thread_id_str']
      @channel = payload['channel']
      @type = payload['type']
      @sender = payload['sender']
      @recipient = payload['recipient']
      @length = payload['length']
      @b64_payload = payload['b64_payload']
      @recorded_at = Time.parse(payload['recorded_at']) if payload['recorded_at']
      @received_at = Time.parse(payload['received_at']) if payload['received_at']
      @created_at = Time.parse(payload['created_at']) if payload['created_at']
      @url = payload['url']
    end

    def payload
      @payload ||= Base64.decode(@b64_payload)
    end

  end
end
