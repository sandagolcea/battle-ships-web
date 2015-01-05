require 'game'
  
describe Game do
  let(:player1){double :player}
  let(:player2){double :player}

  it 'can initialize a new game with two players' do

  end

  it 'should allow a player to place ships on his board' do
    
  end


  it 'should allow a player to look on his opponents board to see where he shot at without showing opponets ship' do

  end

  it 'should allow a player to shoot at opponents board' do

  end

  it 'should report if a player has won' do
    #should look at a players list of ships (board.ships.count)
    #then check if ships.destroyed? == true then that player loses
    #hence other player wins
  end
  
end