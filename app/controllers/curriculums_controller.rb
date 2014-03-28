class CurriculumsController < ApplicationController
	  # A callback to set up an @curriculum object to work with 
	before_action :set_curriculum, only: [:show, :edit, :update, :destroy]

	
	def index
		# get data on all curriculums and paginate the output to 10 per page
		@curriculums = Curriculum.active.alphabetical.paginate(page: params[:page]).per_page(10)
	end

	def show
		@camps = @curriculum.camps
	end

	def new
		@curriculum = Curriculum.new
	end

	def edit
	end

	def create
		@curriculum = Curriculum.new(curriculum_params)
		if @curriculum.save
			redirect_to @curriculum, notice: "#{@curriculum.name} was added to the system."
		else
			render action: 'new'
		end
	end

	def update
	  if @curriculum.update_attributes(curriculum_params)
	  	redirect_to @curriculum, notice: "#{@curriculum.name} was revised in the system."
	  else
	  	render action: 'edit'
	  end
	end

	def destroy
		@curriculum.destroy
		redirect_to curriculums_url, notice: "Removed #{@curriculum.name} from the system"
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_curriculum
			@curriculum = Curriculum.find(params[:id])
		end
		# Never trust parameters from the scary internet, only allow the white list through.
		def curriculum_params
			params.require(:curriculum).permit(:name, :description, :min_rating, :max_rating, :active)
		end

end
