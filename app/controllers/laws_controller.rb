class LawsController < ApplicationController

  before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_law, only: [:show, :edit, :update, :destroy]

  # GET /laws
  # GET /laws.json
  def index
    @laws = Law.all
  end

  # GET /laws/1
  # GET /laws/1.json
  def show
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
    if !(current_user.likes @law) then
      @law.liked_by current_user
    end
    nextLaw
  end

  def dislike
    @law = Law.find(params[:id])
    if !(current_user.dislikes @law) then
      @law.disliked_by current_user
    end
    nextLaw
  end

  def nextLaw
    randomID = rand(Law.all.count) + 1
    @lawNext = Law.find(randomID)
    redirect_to @lawNext
  end

  def comment
    @coment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
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

    def signed_in_user
      redirect_to login_url, notice: "Você não está logado." unless logged_in?
    end
end
