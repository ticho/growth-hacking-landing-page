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

  # returns an array of twitter users to follow
  def find_followers
    results = []
    born2code = @client.user_search('42')
    begin
    followers = @client.follower_ids(born2code[0].id)
    followers.attrs[:ids].sample(5).each do |follower|
      follower = @client.user(follower)
      results.push(follower)
      p follower.screen_name
    end
    rescue StandardError => e
      p "Find_followers error: moving on."
    end
    results
  end

  def follow_accounts
    find_followers.each do |follower|
      @client.follow!(follower)
    end
  end

  def follow_startups
    Startup.all.each do |startup|
      follow(startup.name)
    end
  end

  def follow(name)
    handle = @client.user_search(name)
    begin
      @client.follow!(handle[0])
      p "Followed #{handle[0].screen_name}"
    rescue StandardError
      puts "Error: can't find a twitter account for #{name}"
    end
  end
end
