class TogsController < ApplicationController
      
    def index
      client = Instagram.client(:access_token => session[:access_token])
      @user = client.user
      @follows = client.user_follows('self', :count => 15)

      # @follows.each do |user|
      #   media = Instagram.user_recent_media(user.id)
      #   unless media.first.location
      #     user.destroy
      #   end
      # end

      @hash = Gmaps4rails.build_markers(@follows) do |user, marker|

        unless user.id == 1385068033 || user.id == 833922544
          media = Instagram.user_recent_media(user.id)
          if media 
            if media.first.location
                marker.lat media.first.location.latitude
                marker.lng media.first.location.longitude
            end
          end
          p 'COOOLL'
          p user.id
          p media.first.location
        end
      end

      @hash.reject!(&:empty?)

    end

    def show
      @client = Instagram.client(:access_token => session[:access_token])
      @user = @client.user
      @follows = @client.user_follows('self', :count => 5)
    end

    def follows
      p 'WE HIT FOLLOWS CONTROLLER ACTION'
    end

end
