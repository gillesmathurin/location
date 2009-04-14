desc "peuple la table catégories à partir d'un tableau"
task :populate_categories => :environment do
  tableau = %w( studio Appart-T1 Appart-T2 Appart-T3 Appart-T4 Villa-T2 Villa-T3 Villa-T4 Bungalow )
  
  tableau.each do |cat|
    Category.create(:nom => cat)
  end
   
end