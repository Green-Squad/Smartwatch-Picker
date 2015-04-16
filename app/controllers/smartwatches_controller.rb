class SmartwatchesController < ApplicationController
  def index
    # Sorted on Engadget Score - months since release
    smartwatches = Smartwatch.all
    if(params[:phoneos])
      phoneos = PhoneOs.find_by_name(params[:phoneos])
      smartwatches = phoneos.smartwatches
    end
    smartwatches.to_a.sort  {
        |a, b|  b.engadget_score - (Time.now.to_date - b.release_date).to_i / 30 <=> a.engadget_score - (Time.now.to_date - a.release_date).to_i / 30
    }

    #array = []
    #smartwatches.each do |a|
    #  array << {name: a.name, score: a.engadget_score - (Time.now.to_date - a.release_date).to_i / 30, engadget_score: a.engadget_score}
    #end

    render json: smartwatches
  end
end
