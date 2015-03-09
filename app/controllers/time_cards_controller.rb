class TimeCardsController < ApplicationController
  before_action :set_time_card, only: [:show, :edit, :update, :destroy]

  # GET /time_cards
  # GET /time_cards.json
  def index
    @time_cards = TimeCard.all
  end

  # GET /time_cards/1
  # GET /time_cards/1.json
  def show
  end

  # GET /time_cards/new
  def new
    @time_card = TimeCard.new
  end

  # GET /time_cards/1/edit
  def edit
  end

  # POST /time_cards
  # POST /time_cards.json
  def create
    @uTask = TimeCard.where("user_id == "+current_user.id.to_s+" and clocked_in == 1")
    if @uTask
      @uTask.update_all(clocked_in: 0)
    end
    @time_card = TimeCard.new(time_card_params)

    respond_to do |format|
      if @time_card.save
        format.html { redirect_to request.referer, notice: 'Successfully Clocked In' }
        format.json { render :show, status: :created, location: @time_card }
      else
        format.html { render :new }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_cards/1
  # PATCH/PUT /time_cards/1.json
  def update
    respond_to do |format|
      if @time_card.update(time_card_params)
        format.html { redirect_to request.referer, notice: 'Successfully Clocked Out' }
        format.json { render :show, status: :ok, location: @time_card }
      else
        format.html { render :edit }
        format.json { render json: @time_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_cards/1
  # DELETE /time_cards/1.json
  def destroy
    @time_card.destroy
    respond_to do |format|
      format.html { redirect_to time_cards_url, notice: 'Time card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_card
      @time_card = TimeCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_card_params
      params.require(:time_card).permit(:user_id, :task_id, :clocked_in)
    end
end
