class listingsController < ApplicationController
	before_action :find_listing, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@listing = Listing.all.order("created_at DESC")
	end

	def show
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)

		if @listing.save
			redirect_to @listing, notice: "Successfully created new listing"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render 'edit'
		end
	end

	def destroy
		@listing.destroy
		redirect_to root_path, notice: "Successfully deleted listing"
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :year, :make, :jet_model, :serial_number, :location, :description, :tags, :image, :price)
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end
end

# ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])