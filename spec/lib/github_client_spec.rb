require 'rails_helper'

describe GithubClient do
  it 'should get list of contributors' do
    contributors = GithubClient.contributors_of('rails/rails')
    expect(contributors.length).to eq 10
  end
end
