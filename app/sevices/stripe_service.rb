class StripeService
  # def self.get_customer_id
  #   response = HTTParty.post("https://connect.stripe.com/oauth/token",
  #       :query => { client_secret: ENV['STRIPE_SECRET_KEY'],
  #                   code: ENV['STRIPE_CODE'],
  #                   grant_type: "authorization_code"
  #                 })


  #   response.parsed_response['stripe_user_id']

  # end
end