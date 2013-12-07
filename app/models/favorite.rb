class Favorite < ActiveRecord::Base
  # TODO: Define the relationship to users and/or teams
  
  belongs_to(:user,
             :primary_key => "user_api_id",
             :foreign_key => "user_api_id",
             :class_name => "User")
             
  belongs_to(:team,
               :primary_key => "team_api_id",
               :foreign_key => "team_api_id",
               :class_name => "Team"
             )

  def self.top(team, limit = TOP_LIMIT)
    # TODO: Given a team, return the top n users
  end
end
