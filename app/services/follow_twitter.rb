# frozen_string_literal: true

class FollowTwitter
  include Twitter
  def initialize
    # quelques lignes qui enregistrent les clés d'APIs
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.credentials.twitter[:consumer_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:consumer_key_secret]
      config.access_token        = Rails.application.credentials.twitter[:access_token]
      config.access_token_secret = Rails.application.credentials.twitter[:access_token_secret]
    end
  end

  # def find_followers
  #   follower = []
  #   while cursor != 0
  #     followers = Twitter.follower_ids("2born2code", "Epia", "Epitech", "joinstationf")
  #     follower += followers.ids
  #     sleep(2)
  #   end
  # end

  def follow(name)
    handle = @client.user_search(name)
    begin
      @client.follow!(handle[0])
      p "Followed #handle[0].screen_name"
    rescue StandardError
      puts "Error: can't find a twitter account for #{city['name']}"
    end
  end
end
