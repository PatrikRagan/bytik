class ScrapsitesController < ApplicationController
  before_action :set_scrapsite, only: [:show, :edit, :update, :destroy]

  # GET /scrapsites
  # GET /scrapsites.json
  def index
    @scrapsites = Scrapsite.all
  end

  # GET /scrapsites/1
  # GET /scrapsites/1.json
  def show
  end

  # GET /scrapsites/new
  def new
    @scrapsite = Scrapsite.new
  end

  # GET /scrapsites/1/edit
  def edit
  end

  # POST /scrapsites
  # POST /scrapsites.json
  def create
    @scrapsite = Scrapsite.new(scrapsite_params)

    respond_to do |format|
      if @scrapsite.save
        format.html { redirect_to @scrapsite, notice: 'Scrapsite was successfully created.' }
        format.json { render :show, status: :created, location: @scrapsite }
      else
        format.html { render :new }
        format.json { render json: @scrapsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapsites/1
  # PATCH/PUT /scrapsites/1.json
  def update
    respond_to do |format|
      if @scrapsite.update(scrapsite_params)
        format.html { redirect_to @scrapsite, notice: 'Scrapsite was successfully updated.' }
        format.json { render :show, status: :ok, location: @scrapsite }
      else
        format.html { render :edit }
        format.json { render json: @scrapsite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapsites/1
  # DELETE /scrapsites/1.json
  def destroy
    @scrapsite.destroy
    respond_to do |format|
      format.html { redirect_to scrapsites_url, notice: 'Scrapsite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapsite
      @scrapsite = Scrapsite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapsite_params
      params.require(:scrapsite).permit(:nehnutelnosti, :bazos)
    end
end
