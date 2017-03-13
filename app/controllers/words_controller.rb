class WordsController < ApplicationController
  before_action :set_list
  before_action :set_word, only: [:show, :update, :destroy]

  def index
    @words = @list.words.all
    render json: @words
  end

  def show
    render json: @word
  end

  def create
    @word = @list.words.new(word_params)

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
    def set_list
      @list = @current_user.lists.find_by(id: params[:list_id])
      render json: { error: 'The list does not exist' }, status: 422 unless @list
    end

    def set_word
      @word = @list.words.find_by(id: params[:id])
      render json: { error: 'The word does not exist' }, status: 422 unless @word
    end

    def word_params
      params.require(:word).permit(:name, :list_id)
    end
end
