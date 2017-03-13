class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = @current_user.lists.all
    render json: @lists
  end

  def show
    if @list
      render json: @list
    else
      render json: { error: 'The list does not exist' }, status: :unprocessable_entity
    end
  end

  def create
    @list = @current_user.lists.new(list_params)

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

  private
    def set_list
      @list = @current_user.lists.find_by(id: params[:id])
    end

    def list_params
      params.require(:list).permit(:name)
    end
end
