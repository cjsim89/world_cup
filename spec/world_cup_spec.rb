require '../lib/player'
require '../lib/team'
require '../lib/world_cup'

RSpec.describe WorldCup do
  before :each do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)

    @world_cup = WorldCup.new(2018, [@france, @croatia])

  end

  it 'exists' do
    expect(@world_cup).to be_instance_of(WorldCup)
  end

  it 'has two teams' do
    expect(@world_cup.teams.length).to eq(2)
  end

  it "has two midfielders total" do
    expect(@world_cup.active_players_by_position("midfielder").length).to eq(2)
  end

  it "has one midfielder total after eliminating croatia" do
    @croatia.set_eliminated(true)

    expect(@world_cup.active_players_by_position("midfielder").length).to eq(1)

  end

  it "has 1 forward from function" do
    all_players = @world_cup.all_players_by_position
    expect(all_players["forward"].length).to eq(1)
  end

  it "has 2 midfielders from function" do
    all_players = @world_cup.all_players_by_position
    expect(all_players["midfielder"].length).to eq(2)
  end


end
