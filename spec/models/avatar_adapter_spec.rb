require "rails_helper"

RSpec.describe AvatarAdapter do

  let(:fake_twitter_rest_client) { instance_double(Twitter::REST::Client) }
  let(:image_url) { "fake_url" }

  it "accurately receives image url"do
    user = instance_double(User, twitter_handle: "victorhazbun")

    allow(Twitter::REST::Client).to receive(:new).with(consumer_key: Rails.application.credentials.twitter_api_key, consumer_secret: Rails.application.credentials.twitter_api_secret).and_return(fake_twitter_rest_client)

    allow(fake_twitter_rest_client).to receive_message_chain(:user, profile_image_uri: image_url)

    adapter = AvatarAdapter.new(user)

    expect(adapter.image_url).to eq(image_url)
  end

end
