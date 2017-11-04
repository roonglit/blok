require 'sinatra/base'

class FakeGithub < Sinatra::Base
  get '/repos/:organization/:project/contributors' do
    p "<<<<< reach here >>>>>"
    json_response 200, 'contributors.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(
      Rails.root.join('spec', 'fixtures', 'github', file_name), 'rb'
    )
  end
end
