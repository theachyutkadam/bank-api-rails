# frozen_string_literal: true

module Api
  class CardsController < ApplicationController
    before_action :set_card, only: %i[destroy show update]
    def index
      accountable = current_user_information.accountable
      @cards = if accountable.instance_of?(::Customer)
        accountable.cards.active.order(title: :asc, status: :asc)
      else
        accountable.customer.cards.active.order(title: :asc, status: :asc)
      end
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
      if @card.update(card_params)
        render json: @card
      else
        render json: @card.errors, status: :unprocessable_entity
      end
    end

    def show
      render json: @card
    end

    def destroy
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
        :customer_id,
      )
    end

    def set_card
      @card = Card.find(params[:id])
    end
  end
end
