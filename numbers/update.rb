require 'dotenv/load'
require 'vonage'

VONAGE_API_KEY = ENV['VONAGE_API_KEY']
VONAGE_API_SECRET = ENV['VONAGE_API_SECRET']
COUNTRY_CODE = ENV['COUNTRY_CODE']
VONAGE_NUMBER = ENV['VONAGE_NUMBER']

SMS_CALLBACK_URL = ENV['SMS_CALLBACK_URL']
VONAGE_APPLICATION_ID = ENV['VONAGE_APPLICATION_ID']
VOICE_CALLBACK_TYPE = ENV['VOICE_CALLBACK_TYPE']
VOICE_CALLBACK_VALUE = ENV['VOICE_CALLBACK_VALUE']
VOICE_STATUS_URL = ENV['VOICE_STATUS_URL']

client = Vonage::Client.new(
  api_key: VONAGE_API_KEY,
  api_secret: VONAGE_API_SECRET
)

begin
  response = client.numbers.update(
    country: COUNTRY_CODE,
    msisdn: VONAGE_NUMBER,
    app_id: VONAGE_APPLICATION_ID,
    voiceCallbackType: VOICE_CALLBACK_TYPE,
    voiceCallbackValue: VOICE_CALLBACK_VALUE,
    voiceStatusCallback: VOICE_STATUS_URL,
    moHttpUrl: SMS_CALLBACK_URL
  )
  puts "Number updated"
rescue
  puts "Error updating number"
end