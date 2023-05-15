module OembedEndpointCreating
  extend ActiveSupport::Concern

  def create_endpoint
    @oembed_url.gsub! '{format}', 'json'
    full_url = @oembed_url + '?url=' + url_params
    full_url = full_url + '&format=json' unless full_url.include? 'json'
    get_oembed_json(full_url)
  end

  def get_oembed_json(full_url)
    resp = Net::HTTP.get_response(URI.parse(full_url))
    @results = JSON.parse(resp.body)
    return
  rescue OpenURI::HTTPError => e
    redirect_to root_url, alert: "잘못된 url입니다."
  end
end