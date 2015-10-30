require './tile'

class Board
attr_accessor :grid

def initialize(size = 9, bombs = 8)
  @grid = Array.new(size) {Array.new(size)}
  fill_board(bombs)
end

def fill_board(bombs)
  #made array of values for Tiles, include a given number of bombs
  #then shuffled the array to randomize bomb locations
  cell_array = Array.new(@grid.size ** 2) {"_"}
  0.upto(bombs) do |i|
    cell_array[i] = :b
  end
  cell_array.shuffle!
  p cell_array

  #go through the grid and add a Tile to each spot, which the value
  #from the cell_array
  counter = 0
  @grid.each_with_index do |row, row_idx|
    row.each_with_index do |cell, col_idx|
      @grid[row_idx][col_idx] = Tile.new(cell_array[counter], self, [row_idx, col_idx])
      counter += 1
    end
  end
end

def update_cell(coordinates, decision)
  if decision == 'f'
    @grid[coordinates[0]][coordinates[1]].flag
  else
    bomb_count = @grid[coordinates[0]][coordinates[1]].reveal
    # unless bomb_count > 0
    #   update_cell(neighbor_position, decision) unless bomb_count == :b
    # end
    bomb_count
  end
end

def render
  puts "   #{(0...@grid.size).to_a.join("  ")}"
    @grid.each_with_index do |row, idx|
      row.each_with_index do |cell, idx2|
        print "#{idx} " if idx2 == 0
        print "|#{cell.to_s}|"
      end
      puts ""
    end
end







end
