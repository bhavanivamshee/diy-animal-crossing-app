class DiysController < ApplicationController

    def index
        @diys = Diy.all
    end

    def show
        @diy = Diy.find_by_id(params[:id])
        @get_materials = get_materials
    end

    def new
        @diy = Diy.new
    end

    def create
        @diy = Diy.new(diy_params)
        if @diy.save
        redirect_to diys_path
        else
            @errors = @diy.errors.full_messages
            render :new
        end
    end

    def edit
        @diy = Diy.find_by(id: params[:id])
    end

    def update
        @diy = Diy.find_by(id: params[:id])
        @diy.update(diy_params)
        redirect_to diys_path
    end

    def destroy
        diy = Diy.find_by(id: params[:id])
        diy.delete
        redirect_to diys_path
    end

end

private

def diy_params
    params.require(:diy).permit(:name)
end

def get_materials
    @diy.materials_diy.each do |s|
         s.to_a
    end
end