class ParticularsController < ApplicationController
  attr_accessor :amount, :sender_id, :receiver_id

  before_action :set_particular, only: %i[destroy show update]

  def index
    @particulars = Particular.includes(:sender, :receiver, :card).all
    render json: @particulars
  end

  def create
    ActiveRecord::Base.transaction do
      @particular = Particular.new(particular_params)
      if @particular.save
        update_current_balance
        @particular.reload
        render json: @particular, status: :created
      else
        render json: @particular.errors, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid
      puts 'Oops. We tried to do an invalid operation!'
    end
  end

  def update
    if @particular.update(particular_params)
      render json: @particular
    else
      render json: @particular.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @particular
  end

  def delete
    if @particular.destroy
      head :no_content
    else
      render json: @particular.errors, status: :unprocessable_entity
    end
  end

  def update_current_balance
    sender_accountable = UserInformation.find(params[:sender_id]).accountable
    receiver_accountable = UserInformation.find(params[:receiver_id]).accountable

    sender_accountable = sender_accountable.customer if sender_accountable.instance_of?(::Employee)
    receiver_accountable = receiver_accountable.customer if receiver_accountable.instance_of?(::Employee)

    sender_accountable.update(current_balance: sender_accountable.current_balance - params[:amount].to_f)
    receiver_accountable.update(current_balance: receiver_accountable.current_balance + params[:amount].to_f)
  end

  private

  def particular_params
    params.permit(
      :amount,
      :card_id,
      :sender_id,
      :receiver_id
    )
  end

  def set_particular
    @particular = Particular.find(params[:id])
  end
end
