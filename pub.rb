require "google/cloud/pubsub"

pubsub = Google::Cloud::Pubsub.new
topic_name = "test-topic"

topic = pubsub.topic topic_name
topic.publish "This is a test message."

puts "Message published."