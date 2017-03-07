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
      @client[opt[:path]].put
    when 'post'
      @client[opt[:path]].post
    when 'delete'
      @client[opt[:path]].delete
    end
  end

end