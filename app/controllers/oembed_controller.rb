class OembedController < ApplicationController
  include ::OembedUrlParsing
  before_action :validated_request_url, only: :content_preview

  def content_preview

  end

  private

  def url_params
    params[:requested_url]
  end

  def parse_url_host
    @host = URI.parse(url_params).host
  end

  def validated_request_url
    get_providers_json if url_params
  end
end
