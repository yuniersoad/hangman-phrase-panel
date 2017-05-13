require 'rest-client'
require 'oj'

class PhrasesService
  def self.list_all()
    url = "http://#{ENV['PHRASES_HOST']}:#{ENV['PHRASES_PORT']}/phrases"
    r = RestClient::Request.execute(method: :get, url: url, timeout: 5) rescue nil
    r_body = r.body if r &&  r.code == 200
    if r_body
      Oj.load(r_body)
    else
      []
    end
  end
end
