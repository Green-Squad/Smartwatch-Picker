class SmartwatchesController < ApplicationController
  def index
    
    log_keeper = LogKeeper.new
    log_keeper.ip_address = request.remote_ip

    if(params[:phoneos])
      phoneos = PhoneOs.find_by_name(params[:phoneos])
      smartwatches = phoneos.smartwatches
      log_keeper.phone_os_id = phoneos.id
    else
      smartwatches = Smartwatch.all
    end

    if (params[:battery])
      smartwatches = smartwatches.where('battery_life >= ?', params[:battery])
      log_keeper.battery_life = params[:battery]
    end

    if (params[:price])
      smartwatches = smartwatches.where('price <= ?', params[:price])
      log_keeper.price = params[:price]
    end

    # Sorted on Engadget Score - months since release
    smartwatches = smartwatches.to_a.sort do |a, b|  
       b_score = b.engadget_score
       b_months = (Time.now.to_date - b.release_date).to_i / 30  
       if b_months > 12
         b_score *= 0.98 ** 12
         b_months -= 12
         b_score -= (b_months * 0.25)
       else
         b_score *= 0.98 ** b_months
       end
       
       a_score = a.engadget_score
       a_months = (Time.now.to_date - a.release_date).to_i / 30  
       if a_months > 12
         a_score *= 0.98 ** 12
         a_months -= 12
         a_score -= (a_months * 0.25)
       else
         a_score *= 0.98 ** a_months
       end
       
        b_score <=> a_score

       #b.engadget_score * (0.98) ** ((Time.now.to_date - b.release_date).to_i / 30) <=> a.engadget_score * (0.98) ** ((Time.now.to_date - a.release_date).to_i / 30)
       # |a, b|  b.engadget_score  - ((Time.now.to_date - b.release_date).to_i / 30) <=> a.engadget_score - ((Time.now.to_date - a.release_date).to_i / 30)
    end

    #array = []
    #smartwatches.each do |a|
    #  a_score = a.engadget_score
    #   a_months = (Time.now.to_date - a.release_date).to_i / 30  
    #   if a_months > 12
    #     a_score *= 0.98 ** 12
    #     a_months -= 12
    #     a_score -= (a_months * 0.25)
    #   else
    #     a_score *= 0.98 ** a_months
    #   end
    #  array << {name: a.name, score: a_score, engadget_score: a.engadget_score}
    #end
    
    #render json: array

    smartwatches.each do |smartwatch| 
      smartwatch.image_path = view_context.image_path(smartwatch.image_path)
    end

    log_keeper.save
    
    render json: smartwatches
  end
end
