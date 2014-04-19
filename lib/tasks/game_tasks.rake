namespace :game do
  desc "resets all applicable play columns"
  task :reset_plays => :environment do
    Game.reset_game_plays
    puts "Reset all games' plays columns"
  end
end