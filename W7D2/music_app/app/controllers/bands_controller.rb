class BandsController < ApplicationController
    
    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        if @band
            render :show
        else
            flash.now[:errors] = ["No such band found."]
            render :index
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new(band_params)
        if @band.save
            redirect_to band_url(@band)
        else
            flash.now[:errors] = ["Your band needs a name."]
            render :new
        end
    end

    def edit
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])
        if @band.update(band_params)
            redirect_to bands_url
        else
            flash.now[:errors] = ["This band needs a name."]
            render :edit
        end
    end

    def destroy
        @band = Band.find_by(id: params[:id])
        if @band
            @band.destroy
        else
            flash.now[:errors] = ["No such band found."]
            render :index
        end
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end

end
