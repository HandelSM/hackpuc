class LawsController < ApplicationController
  before_action :set_law, only: [:show, :edit, :update, :destroy]

  # GET /laws
  # GET /laws.json
  def index
    @laws = Law.order(cached_votes_up: :desc).each
  end

  # GET /laws/1
  # GET /laws/1.json
  def show
    @law = Law.find(params[:id])
    @user = current_user
    @opinions = @law.opinions
    @opinion = Opinion.new(user_id: @user.id, law_id: @law.id) if logged_in?
  end

  # GET /laws/new
  def new
    @law = Law.new
  end

  # GET /laws/1/edit
  def edit
  end

  # POST /laws
  # POST /laws.json
  def create
    @law = Law.new(law_params)

    respond_to do |format|
      if @law.save
        format.html { redirect_to @law, notice: 'Law was successfully created.' }
        format.json { render :show, status: :created, location: @law }
      else
        format.html { render :new }
        format.json { render json: @law.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laws/1
  # PATCH/PUT /laws/1.json
  def update
    respond_to do |format|
      if @law.update(law_params)
        format.html { redirect_to @law, notice: 'Law was successfully updated.' }
        format.json { render :show, status: :ok, location: @law }
      else
        format.html { render :edit }
        format.json { render json: @law.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laws/1
  # DELETE /laws/1.json
  def destroy
    @law.destroy
    respond_to do |format|
      format.html { redirect_to laws_url, notice: 'Law was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @law = Law.find(params[:id])
    if !(current_user.voted_for? @law) then
      @law.liked_by current_user
    end
    nextLaw
  end

  def dislike
    @law = Law.find(params[:id])
    if !(current_user.voted_for? @law) then
      @law.disliked_by current_user
    end
    nextLaw
  end

  def nextLaw
    randomID = rand(Law.all.count)
    @lawNext = Law.order(:id)[randomID]
    if current_user.votes.size >= Law.all.count then
      redirect_to semLeis_url and return
    end
    if current_user.voted_for? @lawNext then
      nextLaw
      return
    end
    redirect_to @lawNext
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_law
      @law = Law.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def law_params
      params.require(:law).permit(:description)
    end
end
