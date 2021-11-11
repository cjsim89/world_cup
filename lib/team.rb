class Team
  attr_reader :name,
              :country,
              :eliminated,
              :players

  def initialize(name)
    @name = name
    @country = ""
    @eliminated = false
    @players = []
  end

  def set_eliminated(status)
    @eliminated = status
  end

  def add_player(player)
    @players << player
  end

  def players_by_position(position)
    player_list = []
    @players.each do |player|
      if (player.position == position)
        player_list << player
      end
    end
    player_list
  end


end
