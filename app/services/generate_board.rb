class GenerateBoard
  def initialize(height, width, mines)
    @height = height
    @width = width
    @mines = mines
  end

  def call
    validate_inputs
    create_board
  end

  private

  def validate_inputs
    if @height <= 0 || @width <= 0
      raise 'Height and width must be greater than 0'
    elsif @mines > total_cells
      raise 'Number of mines exceeds the number of cells'
    end
  end

  def total_cells
    @height * @width
  end

  def create_board
    board = Array.new(@height) { Array.new(@width, 0) }
    placed_mines = 0

    while placed_mines < @mines
      row = rand(@height)
      col = rand(@width)

      if board[row][col] != 'M'  # Check if mine is not already placed
        board[row][col] = 'M'    # Place a mine
        placed_mines += 1
      end
    end

    board
  end
end
