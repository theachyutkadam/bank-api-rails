class CardsController < ApplicationController
  before_action :set_user, only: %i[destroy show update]
  def index
    @cards = Card.all
    render json: @cards
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      render json: @card, status: :created
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    if @card.update_attributes(card_params)
      render json: @card, status: :updated
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @card
  end

  def delete
    if @card.destroy
      head :no_content
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private

  def card_params
    params.permit(
      :csv,
      :expire_date,
      :is_deleted,
      :number,
      :pin,
      :status,
      :title,
      :customer_id
    )
  end

  def set_user
    @card = Card.find(params[:id])
  end
end
