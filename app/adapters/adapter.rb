# app/adapters/adapter.rb

module Adapter
  class GoogleMaps

  end
  class Facebook
    require 'koala'

    # access_token and other values aren't required if you set the defaults as described above
    @graph = Koala::Facebook::API.new(access_token)

    profile = @graph.get_object("me")
    friends = @graph.get_connections("me", "friends")
    @graph.put_connections("me", "feed", message: "I am writing on my wall!")

    # Three-part queries are easy too!
    @graph.get_connections("me", "mutualfriends/#{friend_id}")

    # You can use the Timeline API:
    # (see https://developers.facebook.com/docs/beta/opengraph/tutorial/)
    @graph.put_connections("me", "namespace:action", object: object_url)

    # For extra security (recommended), you can provide an appsecret parameter,
    # tying your access tokens to your app secret.
    # (See https://developers.facebook.com/docs/reference/api/securing-graph-api/

    # You may need to turn on 'Require proof on all calls' in the advanced section
    # of your app's settings when doing this.
    @graph = Koala::Facebook::API.new(access_token, app_secret)

    # Facebook is now versioning their API. # If you don't specify a version, Facebook
    # will default to the oldest version your app is allowed to use.
    # See https://developers.facebook.com/docs/apps/versions for more information.
    #
    # You can specify version either globally:
    Koala.config.api_version = "v2.0"
    # or on a per-request basis
    @graph.get_object("me", {}, api_version: "v2.0")
  end
end
