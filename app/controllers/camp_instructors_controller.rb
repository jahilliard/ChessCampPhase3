class CampInstructorsController < ApplicationController

	# A callback to set up an @camp_instructor object to work with 
	before_action :set_camp_instructor, only: [:show, :edit, :update, :destroy]

	def index
		# get all the data on camp_instructors in the system, 10 per page
		@camp_instructors = CampInstructor.paginate(page: params[:page]).per_page(10)
	end

	def show
		# do this
	end

	def new
		@camp_instructor = CampInstructor.new
	end

	def edit

	end

	def create
		@camp_instructor = CampInstructor.new(camp_instructor_params)
		if @camp_instructor.save
			flash[:notice] = "Successfully created Camp Instructor."
			redirect_to @camp_instructor
		else
			render action: 'new'
		end
	end

	def update
		if @camp_instructor.update_attributes(camp_instructor_params)
			flash[:notice] = "Successfully updated Camp Instructor."
			redirect_to @camp_instructor
		else
			render action: 'edit'
		end
	end

	def destroy
		@camp_instructor.destroy
		flash[:notice] = "Successfully destroyed Camp Instructor."
		redirect_to camp_instructors_url
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_camp_instructor
			@camp_instructor = CampInstructor.find(params[:id])
		end
		# Never trust parameters from the scary internet, only allow the white list through.
		def camp_instructor_params
			params.require(:camp_instructor).permit(:camp_id, :instructor_id)
		end
end
