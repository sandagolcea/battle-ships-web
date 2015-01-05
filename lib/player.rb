class Player

  attr_reader :name, :board, :ships
  def initialize(name, board, ships)
    @name = name
    @board = board
    @ships = ships
  end

end