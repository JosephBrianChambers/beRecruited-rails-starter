# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
users = HTTParty.get("http://br-interview-api.heroku.com/users")
teams = HTTParty.get("http://br-interview-api.heroku.com/teams")
favorites = HTTParty.get("http://br-interview-api.heroku.com/favorites")
users = JSON.parse(users)
teams = JSON.parse(teams)
favorites = JSON.parse(favorites)

users.each do |user_hash|
  first_name = user_hash["user"]["first_name"]          
  last_name  = user_hash["user"]["last_name"]
  user_api_id      = user_hash["user"]["id"]
  
  User.create!({:user_api_id => user_api_id, 
                :first_name => first_name,
                :last_name => last_name
              })            
end

teams.each do |team_hash|
  team_api_id = team_hash["team"]["id"]
  location    = team_hash["team"]["city"]
  nickname    = team_hash["team"]["nick"]
  
  Team.create!({:team_api_id => team_api_id,
                :location => location,
                :nickname => nickname
              })
end

favorites.each do |favorites_hash|
  user_api_id      = favorites_hash["favorite"]["user_id"]
  team_api_id      = favorites_hash["favorite"]["team_id"]
  curent_amount    = favorites_hash["favorite"]["current_points"]
  last_week_amount = favorites_hash["favorite"]["last_week_points"]
  
  Favorite.create!({:user_api_id => user_api_id,
                    :team_api_id => team_api_id,
                    :current_amount => curent_amount,
                    :last_week_amount => last_week_amount
                  })
end

