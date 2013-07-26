require 'spec_helper'

describe Spree::Klarna::Order do
	before do
    order = create(:order)
    create(:line_item,
    	quantity: 2,
    	order: order,
    	variant: create(:base_variant,
    		price: 10.00,
    		product: create(:base_product,
    			name: "product1",
    			permalink: "product1" )))
    order.line_items.reload
    @spree_order = order
	end

	let(:klarna_order) { Spree::Klarna::Order.new }

	context "#create" do
		it "creates the order on Klarna" do
		end
	end

	context "#fetch" do
	  it "fetches the order information from Klarna" do
	  end
	end

	context "#update" do
	  it "updates the order information on Klarna" do
	  end
	end

	describe "#properties for create" do
	  before do
  		klarna_order.spree_order = @spree_order
  		@properties = klarna_order.setup_properties_for_create
	  end

	  context ":cart" do
	  	it "contains a item for product1" do
	  		@properties[:cart][:items][0][:name].should eq("product1")
	  	end

	  	context "item product1" do
	  		let(:item) { @spree_order.line_items.first }
	  		let(:item_properties) { @properties[:cart][:items][0] }

		    it "type is physical" do
		    	item_properties[:type].should eq("physical")
		    end

		    it "ean" do
		    	pending "Todo cart-item#ean"
		    	item_properties[:ean].should eq("")
		    end

		    it "reference is the variant's sku" do
		    	sku = @spree_order.line_items.first.variant.sku
		    	item_properties[:reference].should eq(sku)
		    end

		    it "name is the product's name" do
		    	item_properties[:name].should eq("product1")
		    end

		    it "uri is product's full-permalink" do
		    	permalink = "http://demo.spreecommerce.com/product1"
		    	item_properties[:uri].should eq(permalink)
		    end

		    it "image_uri is product's first image's url" do
		    	image = item.variant.images.create
		    	image.attachment = File.open("spec/support/rails.png")
		    	item.save!

		    	@properties = klarna_order.setup_properties_for_create  # call again as spree_order has changed

		    	first_image_url = "http://demo.spreecommerce.com/" + item.variant.images.first.attachment.url
		    	item_properties[:image_uri].should eq(first_image_url)
		    end

		    it "quantity is 2" do
		    	item_properties[:quantity].should eq(2)
		    end

		    it "unit_price is variant's price in cents" do
		    	variant_price_in_cents = 10.00 * 100
		    	item_properties[:unit_price].should eq(variant_price_in_cents)
		    end

		    it "total_price_excluding_tax is the total price of the line-item" do
		    	pending "Not needed. Remove"
		    	item_price_in_cents = item.price * 100
		    	item_properties[:total_price_excluding_tax].should eq(item_price_in_cents)
		    end

		    it "total_tax_amount" do
		    	pending "Todo cart-item#total_tax_amount"
		    end

		    it "total_price_including_tax" do
		    	pending "Todo cart-item#total_tax_amount"
		    end

		    it "discount_rate is discount adjustments as percentage of price" do
		    	discount_rate = 100 * item.adjustments.sum(&:amount)/item.price
		    	item_properties[:discount_rate].should eq(discount_rate)
		    end

		    it "tax_rate" do
		    	pending "Todo cart-item#tax_rate"
		    end
	  	end
	  end

	  context ":merchant" do
	  end
	end
end
