class DiysController < ApplicationController

    def index
        @diys = Diy.all
    end

    def show
        @diy = Diy.find_by_id(params[:id])
        @get_materials = get_materials
    end

end

private

def get_materials
    @diy.materials_diy.each do |s|
         s.to_a
    end
end