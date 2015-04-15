class SmartwatchesController < ApplicationController
  def index
    render json: Smartwatch.all
  end
end
