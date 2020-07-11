class WelcomeController < ApplicationController
	before_action :require_user, only: [:register]
	def home
		@sales = Sale.all
	end
	def about
	end
	def register
	end
end
