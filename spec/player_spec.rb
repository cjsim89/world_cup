require '../lib/player'
require '../lib/team'


RSpec.describe Player do
  before :each do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  it 'exists' do
    expect(@player).to be_instance_of(Player)

  end

  it 'is Luka' do
    expect(@player.name).to eq("Luka Modric")
  end

  it 'is a midfielder' do
    expect(@player.position).to eq("midfielder")
  end

end

RSpec.describe Team do
  before :each do
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  it 'exists' do
    expect(@team).to be_instance_of(Team)
  end

  it "is france" do
    expect(@team.name).to eq("France")
  end

  it "is not eliminated" do
    expect(@team.eliminated).to eq(false)
  end

  # now eliminate them

  it "is now eliminated" do
    @team.set_eliminated(true)
    expect(@team.eliminated).to eq(true)
  end

  it "has no players" do
    expect(@team.players).to be_instance_of(Array);
    expect(@team.players.length).to eq(0)
  end

  it "has two players" do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    expect(@team.players.length).to eq(2)
  end

  it "has one midfielder" do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    midfielders = @team.players_by_position("midfielder").length
    expect(midfielders).to eq(1)
  end

  it "has no defenders" do
    @team.add_player(@mbappe)
    @team.add_player(@pogba)
    defenders = @team.players_by_position("defender").length
    expect(defenders).to eq(0)
  end

end
