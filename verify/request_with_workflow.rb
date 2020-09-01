# frozen_string_literal: true

require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
TO_NUMBER = ENV['TO_NUMBER']

WORKFLOW_ID = ARGV[0]
if WORKFLOW_ID.empty?
  puts 'Please supply the workflow_id'
  exit
end

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

response = client.verify.request(
  number: TO_NUMBER,
  brand: 'AcmeInc',
  workflow_id: WORKFLOW_ID
)

if response
  # display the Verify `request_id`
  puts response.request_id
end
