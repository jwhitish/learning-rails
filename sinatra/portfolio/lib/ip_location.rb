require 'httparty'
require 'json'
require 'dotenv/load'


#replace the IP with the client IP


def get_type(ip)
  type = HTTParty.get("http://api.ipstack.com/#{ip}?access_key=#{ENV['IPSTACKKEY']}&fields=type")
  @typ = JSON.parse(type.body)
  @typ = @typ["type"]
end

def get_city(ip)
  city = HTTParty.get("http://api.ipstack.com/#{ip}?access_key=#{ENV['IPSTACKKEY']}&fields=city")
  @cty = JSON.parse(city.body)
  @cty = @cty["city"]
end

def test(ip)
  type = HTTParty.get("http://api.ipstack.com/#{ip}?access_key=#{ENV['IPSTACKKEY']}&fields=type")
  @typ = JSON.parse(type.body)
  @typ = @typ["type"]
  p @typ
  p @typ.class
end

#test("76.126.148.224")
