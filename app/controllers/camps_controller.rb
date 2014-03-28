class CampsController < ApplicationController
	# A callback to set up an @camp object to work with 
	before_action :set_camp, only: [:show, :edit, :update, :destroy]

	def index
	  # get all camps in reverse chronological order, 10 per page
	  @camps = Camp.chronological.upcoming.paginate(page: params[:page]).per_page(10)
	end
	
	def show
	  # do this
	end
	
	def new
		@camp = Camp.new
	end
	
	def create
		@camp = Camp.new(camp_params)
		if @camp.save
			flash[:notice] = "#{@camp.name} was added to the system."
			redirect_to @camp
		else
			render action: 'new'
		end
	end
	
	def edit
	end
	
	def update
		if @camp.update_attributes(camp_params)
			flash[:notice] = "#{@camp.name} was revised in the system."
			redirect_to @camp
		else
			render action: 'edit'
		end
	end
	
	def destroy
		@camp.destroy
		flash[:notice] = "#{@camp.name} was removed from the system"
		redirect_to camps_url
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_camp
			@camp = Camp.find(params[:id])
		end
		# Never trust parameters from the scary internet, only allow the white list through.
		def camp_params
			params.require(:camp).permit(:curriculum_id, :cost, :start_date, :end_date, :time_slot, :max_students, :active)
		end
end

