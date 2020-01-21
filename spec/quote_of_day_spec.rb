require './quote_of_day'

describe 'Quote of day' do
  it 'requests a quote from quotes.rest' do
    VCR.use_cassette('quotes') do
      expect(
        lambda_handler(event:{}, context:{})
      ).to include(statusCode: 200)
    end
  end
end