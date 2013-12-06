# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
NACLA::Application.config.secret_token = if Rails.env.development? or Rails.env.test?
  '9c5a51582fc9cec050c9e63df362bc9a68977f7b2d2f358ff6398a07083ea6fd7d4616e44a1d7e59d3fe4eb464aab4d7aebd6d584598781d0674db69c52e39e8'
else
  ENV['SECRET_TOKEN']
end

