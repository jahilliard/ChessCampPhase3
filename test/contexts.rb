module Contexts
  def create_curriculums
    @tactics    = FactoryGirl.create(:curriculum)
    @endgames   = FactoryGirl.create(:curriculum, name: "Endgame Principles", min_rating: 700, max_rating: 1500)
    @smithmorra = FactoryGirl.create(:curriculum, name: "Smith-Morra Gambit", active: false)
  end

  def destroy_curriculums
    @tactics.destroy
    @endgames.destroy
    @smithmorra.destroy
  end

    def create_instructors
    @mark   = FactoryGirl.create(:instructor)
    @alex   = FactoryGirl.create(:instructor, first_name: "Alex", phone: "412-268-2323", bio: nil)
    @rachel = FactoryGirl.create(:instructor, first_name: "Rachel", bio: nil, active: false)
  end

  def destroy_instructors
    @mark.destroy
    @alex.destroy
    @rachel.destroy
  end

  def create_camps
    create_curriculums
    @camp1 = FactoryGirl.create(:camp, curriculum: @tactics)    
    @camp2 = FactoryGirl.create(:camp, curriculum: @tactics, start_date: Date.new(2014,7,21), end_date: Date.new(2014,7,25))
    @camp3 = FactoryGirl.create(:camp, curriculum: @tactics, time_slot: "pm", active: false)
    @camp4 = FactoryGirl.create(:camp, curriculum: @endgames, start_date: Date.new(2014,7,21), end_date: Date.new(2014,7,26), time_slot: "pm")
  end

  def destroy_camps
    @camp1.destroy
    @camp2.destroy
    @camp3.destroy
    @camp4.destroy
    destroy_curriculums
  end

  def create_camp_instructors
    create_instructors
    create_camps
    @mark_c1 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp1)
    @mark_c2 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp2)
    @mark_c4 = FactoryGirl.create(:camp_instructor, instructor: @mark, camp: @camp4)
    @alex_c1 = FactoryGirl.create(:camp_instructor, instructor: @alex, camp: @camp1)
    @alex_c2 = FactoryGirl.create(:camp_instructor, instructor: @alex, camp: @camp2)
  end

  def destroy_camp_instructors
    @mark_c1.destroy
    @mark_c2.destroy
    @mark_c4.destroy
    @alex_c1.destroy
    @alex_c2.destroy    
    destroy_camps
    destroy_instructors
  end

end