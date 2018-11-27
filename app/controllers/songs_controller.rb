class SongsController < ApplicationController
    before_action :current_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        song_params[:release_year] = song_params[:release_year].to_i
        @song = Song.new(song_params)
        if @song.valid?
           @song.save
           redirect_to song_path(@song)
        else
          render :new
        end
    end

    def edit
    end

    def update
        @song.update(song_params)
        if @song.valid?
           @song.save
           redirect_to song_path(@song)
        else
          render :edit
        end
    end

    def destroy
        @song.destroy
       redirect_to songs_path(@songs)
    end

    private

    def current_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 
end
