namespace :recommendation do
  desc "Generates recommendation for all games."
  task :generate_recommendations => :environment do
    Recommendation.generate_game_recommendations
  end
end