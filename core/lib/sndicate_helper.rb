require 'sinatra/base'

# Sndicate Helpers
#
# This file extends Sinatra and adds some global helpers.
# The plan is to extract this out into the snd-commands 
# gem when there are enough methods to extract out.
module Sinatra
  module SndicateHelpers
    # Relative Time Helper
    #
    # Returns a relative time from any date. Useful for
    # knowing when a post was published and things like 
    # that.
    #
    # For example, given any date object - 
    #
    #     yesterday = Time.now.to_i - (3600 * 24)
    #     relative_time(yesterday)
    #     #=> "yesterday"
    #
    # All credit goes to Rails. This is ripped verbatim from
    # Active Support. You need a time object converted to an
    # integer for this to work properly.
    #
    # @param from_time [Integer] - A time as # of seconds since epoch
    # @param to_time [Integer] - A time as # of seconds to compare to
    # @param include_seconds [Boolean] - Compare down to the second?
    # @return [String] - A human readable relative time (see example)
    def relative_time(from_time, to_time = Time.now.to_i, include_seconds = false)
      distance_in_minutes = (((to_time - from_time).abs)/60).round
      distance_in_seconds = ((to_time - from_time).abs).round
       
      case distance_in_minutes
        when 0..1
          return (distance_in_minutes==0) ? 'less than a minute ago' : '1 minute ago' unless include_seconds
          case distance_in_seconds
          when 0..5               then 'less than 5 seconds ago'
          when 6..10              then 'less than 10 seconds ago'
          when 11..20             then 'less than 20 seconds ago'
          when 21..40             then 'half a minute ago'
          when 41..59             then 'less than a minute ago'
          else '1 minute ago'
        end
         
        when 2..45              then "#{distance_in_minutes} minutes ago"
        when 46..90             then 'about 1 hour ago'
        when 90..1440           then "about #{(distance_in_minutes / 60).round} hours ago"
        when 1441..2880         then '1 day ago'
        when 2881..43220        then "#{(distance_in_minutes / 1440).round} days ago"
        when 43201..86400       then 'about 1 month ago'
        when 86401..525960      then "#{(distance_in_minutes / 43200).round} months ago"
        when 525961..1051920    then 'about 1 year ago'
        else "over #{(distance_in_minutes / 525600).round} years ago"
      end
    end

    # Date to Time
    #
    # Converts a date object to a time object. Because
    # the `relative_time` methods requires the time 
    # passed to it to be a time object, we define this
    # method as a helper for the relative_time helper.
    #
    # @param date [Date] - Any Date object to convert
    # @return [Time] - Time as the number of seconds since epoch
    def date_to_time(date)
      Time.parse(DateTime.parse(date.to_s).to_s).to_i
    end
  end
end