require './app/services/generate_board'
class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
  end

  def index
    @boards = Board.page(params[:page]).per(9)
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    @board.grid = GenerateBoard.new(@board.height, @board.width, @board.number_of_mines).call

    if @board.save
      flash[:notice] = "Board created successfully!"
      redirect_to board_path(@board)
    else
      flash[:alert] = @board.errors.full_messages.join(", ")
      redirect_to root_path
    end

  rescue StandardError => e
    flash[:alert] = e.message
    redirect_to root_path
  end

  def board_params
    params.require(:board).permit(:email, :name, :height, :width, :number_of_mines)
  end
end