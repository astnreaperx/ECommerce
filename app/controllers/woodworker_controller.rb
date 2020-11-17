class WoodworkerController < ApplicationController
    def index
        @woodworkers = Woodworker.all
    end

    def show
        @woodworker = Woodworker.find(params[:id])
      end
end
