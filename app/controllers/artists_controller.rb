class ArtistsController < ApplicationController
    
    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        redirect_to @artist
    end

    def show
        find_artist
    end

    def edit
        find_artist
    end

    def update
        @artist = find_artist
        @artist.update(artist_params)
        redirect_to @artist
    end


    private
    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end
end
