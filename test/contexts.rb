module Contexts
  ### Contexts used in unit testing 
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
    @rachel = FactoryGirl.create(:instructor, first_name: "Rachel", bio: nil, active: false, phone: "4122682324")
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

  ###########################################
  #--  Contexts used in cucumber testing  --#
  ###########################################
  def create_more_curriculums
    @tal         = FactoryGirl.create(:curriculum, name: "The Tactics of Tal", min_rating: 850, max_rating: 1500, description: "All about the tacicts of Tal.", active: false)
    @nimzo       = FactoryGirl.create(:curriculum, name: "Nimzo-Indian Defense", min_rating: 1000, max_rating: 3000, description: "All about the Nimzo-Indian Defense.")
    @principles  = FactoryGirl.create(:curriculum, name: "Principles of Chess", min_rating: 0, max_rating: 500, description: "All about the basic principles of chess.")
    @positional  = FactoryGirl.create(:curriculum, name: "Positional Understanding", min_rating: 1000, max_rating: 1800, description: "All about positional understanding in chess.")
    @adv_tactics = FactoryGirl.create(:curriculum, name: "Advanced Tactics Training", min_rating: 1000, max_rating: 3000, description: "All about advanced tactical training.")
    @openings    = FactoryGirl.create(:curriculum, name: "Chess Opening for Beginners", min_rating: 0, max_rating: 600, description: "All about the opening for beginners.")
  end

  def destroy_more_curriculums
    @tal.destroy
    @nimzo.destroy
    @principles.destroy
    @positional.destroy
    @adv_tactics.destroy
    @openings.destroy
  end

  def create_more_instructors
    @mike     = FactoryGirl.create(:instructor, first_name: "Mike", last_name: "Ferraco", bio: "A stupendous chess player as you have ever seen.")
    @patrick  = FactoryGirl.create(:instructor, first_name: "Patrick", last_name: "Dustmann", bio: "A stupendous chess player as you have ever seen.")
    @austin   = FactoryGirl.create(:instructor, first_name: "Austin", last_name: "Bohn", bio: "A stupendous chess player as you have ever seen.")
    @nathan   = FactoryGirl.create(:instructor, first_name: "Nathan", last_name: "Hahn", bio: "A stupendous chess player as you have ever seen.")
    @ari      = FactoryGirl.create(:instructor, first_name: "Ari", last_name: "Rubinstein", bio: "A stupendous chess player as you have ever seen.")
    @seth     = FactoryGirl.create(:instructor, first_name: "Seth", last_name: "Vargo", bio: "A stupendous chess player as you have ever seen.")
    @stafford = FactoryGirl.create(:instructor, first_name: "Stafford", last_name: "Brunk", bio: "A stupendous chess player as you have ever seen.")
    @brad     = FactoryGirl.create(:instructor, first_name: "Brad", last_name: "Hess", bio: "A stupendous chess player as you have ever seen.")
    @ripta    = FactoryGirl.create(:instructor, first_name: "Ripta", last_name: "Pasay", bio: "A stupendous chess player as you have ever seen.")
    @jon      = FactoryGirl.create(:instructor, first_name: "Jon", last_name: "Hersh", bio: "A stupendous chess player as you have ever seen.")
    @ashton   = FactoryGirl.create(:instructor, first_name: "Ashton", last_name: "Thomas", bio: "A stupendous chess player as you have ever seen.")
    @noah     = FactoryGirl.create(:instructor, first_name: "Noah", last_name: "Levin", bio: "A stupendous chess player as you have ever seen.")
  end

  def destroy_more_instructors
    @mike.destroy
    @patrick.destroy
    @austin.destroy
    @nathan.destroy
    @ari.destroy
    @seth.destroy
    @stafford.destroy
    @brad.destroy
    @ripta.destroy
    @jon.destroy
    @ashton.destroy
    @noah.destroy
  end

  def create_past_camps
    @camp10 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2015,6,3), end_date: Date.new(2015,6,7), time_slot: "am")
    @camp11 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2015,6,3), end_date: Date.new(2015,6,7), time_slot: "pm")
    @camp12 = FactoryGirl.create(:camp, curriculum: @positional, start_date: Date.new(2015,6,10), end_date: Date.new(2015,6,14), time_slot: "am")
    @camp13 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2015,6,10), end_date: Date.new(2015,6,14), time_slot: "pm")
    @camp10.start_date = Date.new(2013,6,3)
    @camp10.end_date = Date.new(2013,6,7)
    @camp10.save
    @camp11.start_date = Date.new(2013,6,3)
    @camp11.end_date = Date.new(2013,6,7)
    @camp11.save
    @camp12.start_date = Date.new(2013,6,10)
    @camp12.end_date = Date.new(2013,6,14)
    @camp12.save
    @camp13.start_date = Date.new(2013,6,10)
    @camp13.end_date = Date.new(2013,6,14)
    @camp13.save
  end

  def destroy_past_camps
    @camp10.destroy
    @camp11.destroy
    @camp12.destroy
    @camp13.destroy
  end

  def create_upcoming_camps
    @camp20 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2014,6,2), end_date: Date.new(2014,6,6), time_slot: "am")
    @camp21 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2014,6,2), end_date: Date.new(2014,6,6), time_slot: "pm")
    @camp22 = FactoryGirl.create(:camp, curriculum: @positional, start_date: Date.new(2014,6,9), end_date: Date.new(2014,6,13), time_slot: "am")
    @camp23 = FactoryGirl.create(:camp, curriculum: @openings, start_date: Date.new(2014,6,9), end_date: Date.new(2014,6,13), time_slot: "pm")
    @camp24 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2014,6,16), end_date: Date.new(2014,6,20), time_slot: "am")
    @camp25 = FactoryGirl.create(:camp, curriculum: @adv_tactics, start_date: Date.new(2014,6,16), end_date: Date.new(2014,6,20), time_slot: "pm")
    @camp26 = FactoryGirl.create(:camp, curriculum: @principles, start_date: Date.new(2014,6,23), end_date: Date.new(2014,6,27), time_slot: "am")
    @camp27 = FactoryGirl.create(:camp, curriculum: @nimzo, start_date: Date.new(2014,6,23), end_date: Date.new(2014,6,27), time_slot: "pm")
  end

  def destroy_upcoming_camps
    @camp20.destroy
    @camp21.destroy
    @camp22.destroy
    @camp23.destroy
    @camp24.destroy
    @camp25.destroy
    @camp26.destroy
    @camp27.destroy
  end

  def create_more_camp_instructors
    # assuming we've created more instructors and camps
    @mike_c10     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp10)
    @mike_c12     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp12)
    @mike_c13     = FactoryGirl.create(:camp_instructor, instructor: @mike, camp: @camp13)
    @brad_c11     = FactoryGirl.create(:camp_instructor, instructor: @brad, camp: @camp11)
    @ari_c12      = FactoryGirl.create(:camp_instructor, instructor: @ari, camp: @camp12)
    @patrick_c20  = FactoryGirl.create(:camp_instructor, instructor: @patrick, camp: @camp20)
    @austin_c21   = FactoryGirl.create(:camp_instructor, instructor: @austin, camp: @camp21)
    @nathan_c22   = FactoryGirl.create(:camp_instructor, instructor: @nathan, camp: @camp22)
    @ari_c23      = FactoryGirl.create(:camp_instructor, instructor: @ari, camp: @camp23)
    @seth_c24     = FactoryGirl.create(:camp_instructor, instructor: @seth, camp: @camp24)
    @stafford_c25 = FactoryGirl.create(:camp_instructor, instructor: @stafford, camp: @camp25)
    @ashton_c25   = FactoryGirl.create(:camp_instructor, instructor: @ashton, camp: @camp25)
    # No camps assigned to noah, jon, ripta
    # No instructors for camps 26 (principles) and 27 (nimzo) [and camp3 (tactics) earlier]
  end

  def destroy_more_camp_instructors
    @mike_c10.destroy
    @mike_c12.destroy
    @mike_c13.destroy
    @brad_c11.destroy
    @ari_c12.destroy
    @patrick_c20.destroy
    @austin_c21.destroy
    @nathan_c22.destroy
    @ari_c23.destroy
    @seth_c24.destroy
    @stafford_c25.destroy
    @ashton_c25.destroy
  end

end