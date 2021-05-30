class MaterialsController < ApplicationController

    def index
        @materials = Material.all
    end

    def new
        @diy = Diy.find_by(id: params[:diy_id])
        @materials = Material.new
        @diys = Diy.all
    end

    def create
        @material = Material.create
        @material.user = current_user
        @material.diy_id = params[:diy_id]
        if @material.save 
            redirect_to materials_path
        else
            render :new
        end
    end

    def show
    end

    private

    #def materials_params
       # params.require(:materials).permit(:name, :count, :diy_id)
  #  end

end
