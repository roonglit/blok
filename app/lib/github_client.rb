require 'rest-client'

class GithubClient
  def self.contributors_of(repo_name)
    RestClient.get("https://api.github.com/repos/#{repo_name}/contributors")
  end
end
