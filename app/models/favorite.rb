TOP_LIMIT = 5
class Favorite < ActiveRecord::Base
  # TODO: Define the relationship to users and/or teams
  
 
  
  belongs_to(:user,
               :primary_key => "user_api_id",
               :foreign_key => "user_api_id",
               :class_name => "User"
             )
             
  belongs_to(:team,
               :primary_key => "team_api_id",
               :foreign_key => "team_api_id",
               :class_name => "Team"
             )

  def self.top(team_api_id, limit = TOP_LIMIT)
    # TODO: Given a team, return the top n users
    #no SQL injection
    ActiveRecord::Base.connection.execute(<<-SQL)
      SELECT DISTINCT f.current_amount, f.last_week_amount, u.first_name, u.last_name
      FROM favorites as f INNER JOIN users as u
      ON f.user_api_id = u.user_api_id
      WHERE f.team_api_id = #{team_api_id}
      ORDER BY f.current_amount DESC
      LIMIT 5;
    SQL
  end
end







