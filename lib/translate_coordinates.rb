module TranslateCoordinates

  def translate_coordinates(coord)
    x = coord.split(//).first.ord - 'A'.ord
   
    if coord.size == 2
      y = coord.split(//).last.to_i 
    else # coord.size >= 3 
      y = coord.split(//).last(coord.size-1).join.to_i
    end
    [x,y-1]
  end

end