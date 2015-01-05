require 'board'
  

describe Board do
  
  let(:board){Board.new(:size => 4)}
  let(:ship){double :ship, :sunk? => false}
  let(:titanic){double :ship, :sunk? => true}
  
  it 'should have a size' do
    expect(board.size).not_to eq nil
  end

  it 'should initialize an empty board' do
    expect(board).to be_empty
  end

  it 'should not be empty after a ship is added' do
    allow(ship).to receive(:coordinates).and_return([[0,0],[1,0],[2,0]])
    board.add_ship(ship)
    expect(board).not_to be_empty
  end

  it 'should be able to be shot at' do
    board.handle_shot("B2") #B2
    expect(board).not_to be_empty
  end

  it 'should not be able to take shots on negative coordinates' do
    board.handle_shot("B-1") 
    expect(board).to be_empty
  end

  it 'should not be able to take shots outside the boundaries' do
    board.handle_shot("C40") 
    expect(board).to be_empty
  end

  it 'should accept shots on the boundaries' do
    board.handle_shot("A1") 
    expect(board).not_to be_empty
    # TODO : refractor tests for board 
    # example - expect(board.status('A1')).to eq MISS
  end


  it 'should not shoot over existing shot' do
    board.handle_shot("A2")
    expect(board.handle_shot("A2")).to eq false
  end

  it 'should not add a ship outside the board' do
    allow(ship).to receive(:coordinates).and_return([[0,0],[1,0],[30,0]])
    expect(board.add_ship(ship)).to eq false
  end

  # TODO: remake this test to add 2 ships on top of another
  it 'should not add a ship on a position that is already taken' do
    allow(ship).to receive(:coordinates).and_return([[0,0],[0,1],[0,2]])
    board.add_ship(ship)
    expect(board.add_ship(ship)).to eq false
  end


  it 'should have a list with ships' do
    allow(ship).to receive(:coordinates).and_return([[0,0],[1,0],[2,0]])
    board.add_ship(ship)
    expect(board.ships.count).to eq 1
  end


  it 'should make sure the ship is damaged' do
  end

  it 'should have floating ship left' do
    allow(ship).to receive(:coordinates).and_return([[0,0],[0,1],[0,2]])
    board.add_ship(ship)
    expect(board.any_floating_ships_left?).to eq true
  end

  it 'should not have floating ships left once they are all sunk' do
    allow(titanic).to receive(:coordinates).and_return([[0,0],[0,1],[0,2]])
    board.add_ship(titanic)
    expect(board.any_floating_ships_left?).to eq false
  end

  # xit 'should mark all cells with KILL(4) if a ship sunk' do
    # allow(titanic).to receive(:coordinates).and_return([[0,0],[0,1],[0,2]])
    # board.add_ship(titanic)
    # expect
  # end

end
