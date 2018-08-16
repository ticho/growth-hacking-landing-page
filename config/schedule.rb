# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# follows as many students and startups as possible
# and shows them to the appropriate LP
every :tuesday, :at => '9am' do
  # get more startup names in the DB
  runner "ScrapStartup.new.scrap"
  runner "FollowTwitter.new.follow_startups"
  runner "FollowTwitter.new.follow_accounts"
end