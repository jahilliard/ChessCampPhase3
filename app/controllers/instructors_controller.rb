class InstructorsController < ApplicationController
	# A callback to set up an @instructor object to work with 
	before_action :set_instructor, only: [:show, :edit, :update, :destroy]

	def index
		# finding all the active instructors and paginating that list (will_paginate)
		@instructors = Instructor.active.alphabetical.paginate(page: params[:page]).per_page(10)
	end

	def show
		# do this 
	end

	def new
		@instructor = Instructor.new
	end

	def edit
	end

	def create
		@instructor = Instructor.new(instructor_params)
		if @instructor.save
			# if saved to database
			flash[:notice] = "Successfully created #{@instructor.proper_name}."
			redirect_to @instructor # go to show instructor page
		else
			# return to the 'new' form
			render action: 'new'
		end
	end

	def update
		if @instructor.update_attributes(instructor_params)
			flash[:notice] = "Successfully updated #{@instructor.proper_name}."
			redirect_to @instructor
		else
			render action: 'edit'
		end
	end

	def destroy
		@instructor.destroy
		flash[:notice] = "Successfully removed #{@instructor.proper_name}"
		redirect_to instructors_url
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_instructor
			@instructor = Instructor.find(params[:id])
		end
		# Never trust parameters from the scary internet, only allow the white list through.
		def instructor_params
			params.require(:instructor).permit(:first_name, :last_name, :bio, :phone, :email, :active)
		end
end
