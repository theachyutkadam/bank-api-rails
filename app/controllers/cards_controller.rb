class CardsController < ApplicationController
  def index
    @cards = Card.all
    render json: @cards
  end

  def create; end

  def update; end

  def show; end

  def delete; end
end
