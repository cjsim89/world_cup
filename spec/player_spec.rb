require '../lib/player'



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
