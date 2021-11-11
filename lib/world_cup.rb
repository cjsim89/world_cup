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

  def all_players_by_position
    all_players = {"forward" => [], "midfielder" => [], "defender" => []}
    @teams.each do |team|
      team.players.each do |player|
        if (player.position == "forward")
          all_players["forward"].push(player)
        end
        if player.position == "midfielder"
          all_players["midfielder"].push(player)
        end
        if player.position == "defender"
          all_players["defender"].push(player)
        end
      end
    end
    all_players
  end

end
