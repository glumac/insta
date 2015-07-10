class TogsController < ApplicationController
      
    def index
      client = Instagram.client(:access_token => session[:access_token])
      @user = client.user
      @follows = client.user_follows('self', :count => 30)

      @hash = Gmaps4rails.build_markers(@follows) do |user, marker|
        begin
          media = Instagram.user_recent_media(user.id)

            if media.first.location
                marker.lat media.first.location.latitude
                marker.lng media.first.location.longitude
            end

          p user.id
          p media.first.location

        rescue Exception => e
          puts e
        end
      end.reject!(&:empty?)

    end

end
