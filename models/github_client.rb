require 'rest-client'
require 'pry'
class GithubClient

  def initialize
    @client = RestClient::Resource.new('https://api.github.com')
  end

  def call(opt={})

    case opt[:method].downcase
    when 'get'
      @client[opt[:path]].get
    when 'put'
      # implement @client[opt[:path]].put
    when 'post'
      # implement @client[opt[:path]].post
    when 'delete'
      # implement @client[opt[:path]].delete
    end
  end

end