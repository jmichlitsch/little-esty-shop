# RSpec.configure do |config|
#   config.before(:each) do
#     repo_response = File.read("spec/fixtures/gh_repo_name.json")
#     WebMock.stub_request(:get, "https://api.github.com/repos/klatour324/little-esty-shop").
#          with(
#            headers: {
#        	  'Accept'=>'*/*',
#        	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
#        	  'Authorization'=>'token c7947decb7fe37f01c55d6ae45fae3e4d675dce3',
#        	  'User-Agent'=>'Faraday v1.3.0'
#            }).
#          to_return(status: 200, body: "", headers: {})
#
#     contributors_response = File.read("spec/fixtures/gh_contributors.json")
#     WebMock.stub_request(:get, "https://api.github.com/repos/jmichlitsch/little-esty-shop/contributors").to_return(status: 200, body: contributors_response)
#
#     pulls_response = File.read("spec/fixtures/gh_pulls.json")
#     WebMock.stub_request(:get, "https://api.github.com/repos/klatour324/little-esty-shop/pulls?state=closed").to_return(status: 200, body: pulls_response)
#    end
# end
