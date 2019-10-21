class SongsController < ApplicationController
    def all
        @user = User.find(session[:user_id])
        @songs = Song.order(number: :desc).all
    end

    def create
        new_song = Song.create(song_params)
        if new_song.valid?
            redirect_to "/songs" 
        else
            flash[:errors] = new_song.errors.full_messages
            redirect_to "/songs"
        end
    end

    def show
        @song = Song.find_by(id: params[:id])
        if @song
            #@entries = @song.entries
            @entries = Entry.order(number: :desc).where(song: @song)
        else
            flash[:errors] = ["No song found"]
            redirect_to "/songs"
        end
    end

    private

    def song_params
        params.require(:song).permit(:title,:artist)
    end
end
