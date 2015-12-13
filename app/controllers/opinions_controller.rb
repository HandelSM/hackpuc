class OpinionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)
    @opinion.save
    redirect_to Law.find(@opinion.law_id) and return
  end

  # DELETE /opinions/1
  # DELETE /opinions/1.json
  def destroy
    @opinion.destroy
    respond_to do |format|
      format.html { redirect_to opinions_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @opinion = Opinion.find(params[:id])
    if not(current_user.voted_for? @opinion) then
      @opinion.liked_by current_user
    end
    redirect_to @opinion.law
  end

  def dislike
    @opinion = Opinion.find(params[:id])
    if not(current_user.voted_for? @opinion) then
      @opinion.disliked_by current_user
    end
    redirect_to @opinion.law
  end
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:content, :user_id, :law_id)
    end
end
