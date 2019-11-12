
require 'net/http'
require 'json'

$requester = -> (url){ 
  Net::HTTP.get_response(URI url)
} 

def lambda_handler(event:, context:, requester: $requester)

  response = requester.call 'https://quotes.rest/qod.json'

  failure_response = {
    statusCode: response.code,
    body: JSON.generate("Sorry, no quote today :(") 
  } 
    
  return failure_response unless response.kind_of? Net::HTTPSuccess

  parsed_response = JSON.parse response.body

  quote = parsed_response["contents"]["quotes"].first["quote"]
  author = parsed_response["contents"]["quotes"].first["author"]
  
  { statusCode: 200,
    body: JSON.generate({
      quote: quote, 
      author: author,
      credits: "    
      Created by They Said So
      See more at https://theysaidso.com/api
    "}),
  }
end
