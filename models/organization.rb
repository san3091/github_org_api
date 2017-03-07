require_relative './github_client.rb'
require 'json'

module Github
  class Organization < OpenStruct

    def self.get(name, repo=nil)
      client = GithubClient.new

      org_response = client.call(organization_params(name))
      org_params = JSON.parse(org_response.body)

      if repo
        pr_response = client.call(pull_request_params(name, repo))
        org_params.merge({ pull_requests: JSON.parse(pr_response) })
      end
      
      new(org_params)
    end

    private

    def self.organization_params(org)
      {
        method: 'get',
        path: "orgs/#{org}"
      }
    end

    def self.pull_request_params(org, repo)
      {
        method: 'get',
        path: "repos/#{org}/#{repo}/pulls"
      }
    end
  end
end