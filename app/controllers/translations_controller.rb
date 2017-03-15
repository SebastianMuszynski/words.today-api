class TranslationsController < ApplicationController
  before_action :set_word, only: [:index]
  before_action :set_translation, only: [:show, :update, :destroy]

  def index
    @translations = @word.translations.all
    render json: @translations
  end

  def show
    render json: @translation
  end

  def create
    @translation = Translation.new(translation_params)

    if @translation.save
      render json: @translation, status: :created
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @translation.update(translation_params)
      render json: @translation
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @translation.destroy
  end

  private
    def set_word
      @word = @list.words.find_by(id: params[:word_id])
      render json: { error: 'The word does not exist' }, status: 422 unless @word
    end

    def set_translation
      @translation = Translation.find_by(id: params[:id])
    end

    def translation_params
      params.require(:translation).permit(:name, :word_id)
    end
end
