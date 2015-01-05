require 'player'

describe Player do

  let(:board){double :board}
  let(:ship){double :ship}
  let(:ship){double :ship}
  let(:player){Player.new("Me",board,ship)}
  
  it 'should have a name' do
    expect(player.name).to eq "Me"
  end

end