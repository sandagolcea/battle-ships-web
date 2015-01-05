require_relative 'translate_coordinates'

class Board
	
  include TranslateCoordinates

  DEFAULT_SIZE = 10

  WATER = 0
  BOAT = 1
  MISS = 2
  HIT = 3
  KILL = 4

  attr_reader :size

	def initialize(options = {})
    @size = options.fetch(:size,DEFAULT_SIZE)
    @ships = []
    create(@size)
	end

  def create(size)
    @matrix = Array.new(size) { Array.new(size) { WATER } }
  end

  def handle_shot(coord)
    # 1. coordinates = translate_coordinates(coord)
    # 2. if is_valid_and_not_already_hit?(coordinates)
    # 3. process_hit_on(coordinates)

    coordinates = translate_coordinates(coord)
    x = coordinates.first
    y = coordinates.last

    if is_valid?(x,y) && !is_shot?(x,y)
      hit_ship = ships.select {|ship| ship.take_hit(x,y)}.first
      # TODO : refractor this into a new method 
      if hit_ship != nil 
        if hit_ship.sunk?
          hit_ship.hit_list.each {|x,y| @matrix[x][y] = KILL} 
        else
          @matrix[x][y] = HIT
        end
      else
        @matrix[x][y] = MISS
      end

    else 
      false  
    end
  end

  def add_ship(ship)

    ship.coordinates.each {|c| return false if !is_valid?(c.first,c.last)}
    ship.coordinates.each {|c| return false if is_taken?(c.first,c.last)}

    ship.coordinates.each do |cell| 
      @matrix[cell.first][cell.last] = BOAT
    end

    @ships << ship
  end

  def grid
    @matrix
  end

  def target_grid
    @matrix.map {|col| col.map {|cell| cell == BOAT ? WATER : cell  } }
  end

  def empty?
    @matrix.all? {|column| column.all? {|cell| cell == WATER} }
  end

  def ships
    @ships
  end

  def any_floating_ships_left?
    @ships.any? {|ship| !ship.sunk? }
  end

  private

  def is_shot?(x,y)
    @matrix[x][y] != BOAT && @matrix[x][y] != WATER 
  end

  def is_valid?(x,y)
    return x >= 0 && y >= 0 && x < @size && y < @size
  end

  def is_taken?(x,y)
    @matrix[x][y] != WATER
  end

end
