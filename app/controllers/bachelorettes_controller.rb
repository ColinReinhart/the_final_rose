class BachelorettesController < ApplicationController

  def show
    @bachelorette = Bachelorette.find(params[:bachelorette_id])
  end

end
