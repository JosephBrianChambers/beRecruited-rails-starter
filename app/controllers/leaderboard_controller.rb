class LeaderboardController < ApplicationController
  def index
    selected_nick = params[:team]
    @teams = Team.all

    if selected_nick
      #Fetch team based on dropdown selection 
      @team = Team.where(:nickname => selected_nick).first 
 
      #Fetch top 5 leaders for this team
      @leaders = Favorite.top(@team.team_api_id)
    end
    
    respond_to do |format|
      format.html  { render :index }
      format.json  { render :json => {"team" => @team, "leaders" => @leaders}}
    end
  end
end
