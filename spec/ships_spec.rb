require 'ship'

describe Ship do
  let(:ship){Ship.new(3)}
  let(:baby_ship){Ship.new(2)}
  let(:board){double :board}

  it 'should not be sunk by default' do
    expect(baby_ship).not_to be_sunk
  end

  it 'should have a size' do 
    expect(baby_ship.length).to eq 2
  end

  it 'should create a vertical boat' do
    ship.set_coordinates("A1","vertical")
    expect(ship.coordinates).to eq [[0,0],[1,0],[2,0]]
  end


  it 'should create a horizontal boat' do
    ship.set_coordinates("A1","horizontal")
    expect(ship.coordinates).to eq [[0,0],[0,1],[0,2]]
  end
  
  # TODO: refactor
  it 'a new ship is not hit when added' do
    ship.set_coordinates("A1","horizontal")
    expect(ship.coordinates.length).to eq ship.length
  end

  it 'can be hit' do
    ship.set_coordinates("B1","horizontal")
    expect(ship.take_hit(1,0)).to eq true
  end

  it 'cannot be hit if you shoot outside the boat' do
    ship.set_coordinates("B1","horizontal")
    expect(ship.take_hit(2,2)).to eq false
  end

  it 'can kill/sink a ship' do
    ship.set_coordinates("A1", "vertical")
    ship.take_hit(0,0)
    ship.take_hit(1,0)
    ship.take_hit(2,0)
    expect(ship).to be_sunk
  end

  it 'can be hit but not yet sunk' do
    ship.set_coordinates("A1", "vertical")
    ship.take_hit(2,0)
    expect(ship).not_to be_sunk
  end


  it 'can create a battle ship' do
    expect(Ship.battleship.length).to eq 4
  end

  it 'can create a submarine' do
    expect(Ship.submarine.length).to eq 3
  end

  it 'can create a destroyer' do
    expect(Ship.destroyer.length).to eq 2
  end

  it 'the hit list is not empty if the ship has been hit' do
    ship.set_coordinates("A1", "vertical")
    ship.take_hit(0,0)
    expect(ship.hit_list.size).to eq 1
  end
  
end