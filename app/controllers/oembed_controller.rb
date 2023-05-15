class OembedController < ApplicationController
  include ::OembedUrlParsing
  require 'open-uri'
  require 'net/http'
  before_action :validated_request_url, only: :content_preview

  def content_preview

  end

  private

  def url_params
    params[:url_address]
  end

  def url_host
    @host = URI.parse(url_params).host
  end

  def validated_request_url
    get_providers_json if url_params
  end
end
