require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new
subscription_name = "test-sub"

subscription = pubsub.subscription subscription_name
subscriber   = subscription.listen do |received_message|
  puts "Received message: #{received_message.data}"
  received_message.acknowledge!
end

subscriber.start
# Let the main thread sleep for 60 seconds so the thread for listening
# messages does not quit
sleep 60
subscriber.stop.wait!