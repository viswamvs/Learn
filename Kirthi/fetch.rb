require 'rest-client'
require 'json'
require 'json_converter'
require 'csv'
response = RestClient.get('http://newsapi.org/v2/top-headlines?country=in&apiKey=0630ee9a73044403bf6d17b49500d47d')
response = JSON.parse(response)
keys_to_extract = [ "title", "name", "description", "url" ]
response["articles"].each do |article|
  article.select! { |key, value| ( keys_to_extract.include?(key) || ( key == "source" && value.select! { |key, value| keys_to_extract.include?(key) }))}
  json_converter = JsonConverter.new
  csv_string = json_converter.generate_csv article
puts csv_string
end

  





