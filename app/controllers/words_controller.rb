class WordsController < ApplicationController
  before_action :set_word, only: [:show, :update, :destroy]

  def index
    @words = Word.all
    render json: @words
  end

  def show
    render json: @word
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      render json: @word, status: :created, location: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  def update
    if @word.update(word_params)
      render json: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy
  end

  private
    def set_word
      @word = Word.find(params[:id])
    end

    def word_params
      params.require(:word).permit(:name, :list_id)
    end
end
