class EntriesController < ApplicationController
    def create
        song_id = params[:id]
        user_id = session[:user_id]
        song = Song.find(song_id)
        user = User.find(user_id)
        existing_entry = Entry.find_by(user:user, song:song)
        if existing_entry
            puts "EXISTING"
            existing_entry.number += 1
            existing_entry.save
            song.number += 1
            song.save
            redirect_to "/songs"
        else
            puts "NEW"
            new_entry = Entry.create(user:user, song:song)
            if new_entry.valid?
                song.number += 1
                song.save
                redirect_to "/songs"
            else
                flash[:errors] = new_entry.errors.full_messages
                redirect_to "/songs"
            end
        end
    end
end
