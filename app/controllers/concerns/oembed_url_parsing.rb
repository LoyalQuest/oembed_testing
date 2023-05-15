module OembedUrlParsing
  extend ActiveSupport::Concern
  include OembedEndpointCreating

  def get_providers_json
    if url_host
      oembed_providers = RestClient.get 'https://oembed.com/providers.json'
      @providers_json = JSON.parse(oembed_providers)
      return get_oembed_url
    else
      redirect_to root_url, alert: "Invalid URL"
    end
  end

  def get_oembed_url
    @providers_json.each do |provider|
      if provider['endpoints'][0]['schemes']
        schemes = provider['endpoints'][0]['schemes'].map { |url| url.split('/')[2]&.gsub '*', 'www' }
        if schemes.include? @host
          @oembed_url = provider['endpoints'][0]['url']
          return create_endpoint
        end
      end
    end
    redirect_to root_url, alert: "The url does not provide oEmbed." and return
  end
end