class User < ActiveRecord::Base
  # TODO: Define the relationship to teams and/or favorites
  
  has_many(:favoritings,
             :primary_key => "user_api_id",
             :foreign_key => "user_api_id",
             :class_name => "Favorite"
           )
           
  has_many(:favorite_teams,
           :primary_key => "user_api_id",
           :through => :favoritings,
           :source => :team)   

end
