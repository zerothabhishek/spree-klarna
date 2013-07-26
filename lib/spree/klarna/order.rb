module Spree
  module Klarna
    class Order
    	attr_reader :id, :properties, :checkout_handler
    	attr_accessor :spree_order

    	def initialize(args={})
    		@id = args[:id]
    		@checkout_handler = Spree::Klarna::CheckoutHandler.new
    	end

    	def create
    		data = setup_properties_for_create
    		@checkout_handler.post(data: data)
    	end

    	def fetch
    		@checkout_handler.get(id: @id)
    	end

    	def update
    		data = setup_properties_for_update
    		@checkout_handler.put(id: @id, data: data)
    	end

    	def setup_properties_for_create
    		properties = {} # empty_properties
    		properties[:purchase_country]  = @spree_order.bill_address.country  ## Todo: check
    		properties[:purchase_currency] = ""         ## @spree_order.purchase_currency ## Todo: check
    		properties[:locale]   = "sv-ce"             ## Todo: check
    		properties[:cart]     = cart_properties
    		properties[:merchant] = merchant_properties
    		properties
    	end

    	def setup_properties_for_update
    		setup_properties_for_create
    	end

    	def cart_properties
    		{
    			items: @spree_order.line_items.map{ |item| cart_item_data(item) },
    			total_price_excluding_tax: "",
    			total_tax_amount: "",
    			total_price_including_tax: ""
    		}
    	end

    	def cart_item_data(item)
    		variant = item.variant

    		cart_item_properties = {}
    		cart_item_properties[:type] = "physical"
    		cart_item_properties[:ean]  = ""
    		cart_item_properties[:reference] = variant.sku
    		cart_item_properties[:name] = variant.name
    		cart_item_properties[:url]  = "http://" + Spree::Config[:site_url] + "/" + variant.permalink
    		cart_item_properties[:image_uri] = variant.images.first ? "http://" + Spree::Config[:site_url] + "/" + variant.images.first.attachment.url : ""
    		cart_item_properties[:quantity] = item.quantity
    		cart_item_properties[:unit_price] = variant.price.to_f * 100    # in cents
    		cart_item_properties[:total_price_excluding_tax] = item.price.to_f * 100
    		cart_item_properties[:total_tax_amount] = ""
    		cart_item_properties[:total_price_including_tax] = item.price.to_f * 100,
    		cart_item_properties[:discount_rate] = item.adjustments.sum(&:amount)/item.price * 100
    		cart_item_properties[:tax_rate] = ""
    		cart_item_properties
    	end

    	def merchant_properties
    		{
    			id:               Spree::Klarna::Config.preferred_id,
    			terms_uri:        Spree::Klarna::Config.preferred_terms_uri,
    			checkout_uri:     Spree::Klarna::Config.preferred_checkout_uri,
    			confirmation_uri: Spree::Klarna::Config.preferred_confirmation_uri,
    			push_uri:         Spree::Klarna::Config.preferred_push_uri
    		}
    	end

    	def empty_properties
    		{
    			id: "",
    			merchant_reference: "",
    			purchase_country: "",
    			purchase_currency: "",
    			locale: "",
    			status: "",
    			reference: "",
    			reservation: "",
    			started_at: "",
    			completed_at: "",
    			created_at: "",
    			last_modified_at: "",
    			expires_at: "",
    			billing_address: {
    				given_name: "",
    				family_name: "",
    				care_of: "",
    				street_address: "",
    				postal_code: "",
    				city: "",
    				country: "",
    				email: "",
    				phone: ""
    			},
    			shipping_address:{
    				given_name: "",
    				family_name: "",
    				care_of: "",
    				street_address: "",
    				postal_code: "",
    				city: "",
    				country: "",
    				email: "",
    				phone: ""
    			},
    			cart: {
    				total_price_excluding_tax: "",
    				total_tax_amount: "",
    				total_price_including_tax: "",
    				items: [
    					{ type: "",
    						ean: "",
    						reference: "",
    						name: "",
    						uri: "",
    						image_uri: "",
    						quantity: "",
    						unit_price: "",
    						total_price_excluding_tax: "",
    						total_tax_amount: "",
    						total_price_including_tax: "",
    						discount_rate: "",
    						tax_rate: ""
    					}
    				]
    			},
  				customer: {
  					type: ""
  				},
  				gui: {
  					layout: "",
  					options: "",
  					snippet: ""
  				},
  				merchant: {
  					id: "",
  					terms_uri: "",
  					checkout_uri: "",
  					confirmation_uri: "",
  					push_uri: ""
  				}
    		}
    	end
    end
  end
end
