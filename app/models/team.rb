class Team < ActiveRecord::Base
  # TODO: Define the relationship to users and/or favorites
  
  
  has_many(:favoritings,
             :primary_key => "team_api_id",
             :foreign_key => "team_api_id",
             :class_name => "Favorite"
           )
  has_many(:users,
             :primary_key => "team_api_id",
             :through => :favoritings,
             :source => :user,
           )
end
