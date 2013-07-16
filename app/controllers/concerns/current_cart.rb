module CurrentCart
	extend ActiveSupport::Concern

	private
	
		def set_cart
		    @cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound # error no cart, so we rescue and create a cart
			@cart = Cart.create 
			session[:cart_id] = @cart.id
	    end 
end