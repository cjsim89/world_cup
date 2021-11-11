class WorldCup
  attr_reader :year,
              :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    player_list = []
    @teams.each do |team|
      if (team.eliminated == false)
        team.players.each do |player|
          if (player.position == position)
            player_list << player
          end
        end
      end
    end
    player_list
  end
end
