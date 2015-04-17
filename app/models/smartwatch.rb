class Smartwatch < ActiveRecord::Base
  has_many :supported_oses
  has_many :phone_oses, through: :supported_oses
  
  
  def update_price
   request = Vacuum.new
   request.associate_tag = 'greensq-20'
   
   asin = /http:\/\/(?:www\.|)amazon\.com\/(?:gp\/product|[^\/]+\/dp|dp)\/([^\/]+)/.match(self.amazon_url)
   asin = asin[1]
   
   response = request.item_lookup(
     query: {
      'ItemId' => asin,
      'ResponseGroup' => 'Offers'
      }
    )
    
     price = response.to_h['ItemLookupResponse']['Items']['Item']['Offers']['Offer']['OfferListing']['Price']['FormattedPrice'].slice(1..-1)
     
     self.update(price: price) if price 
  end
  
  def self.update_prices
   Smartwatch.all.each do |smartwatch|
     smartwatch.update_price
     sleep 2 # because we are too fast for Amazon
   end
  end
end
