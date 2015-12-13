class OpinionsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  # POST /opinions
  # POST /opinions.json
  def create
    @opinion = Opinion.new(opinion_params)
    if @opinion.save
      redirect_to root_url
    else
      redirect_to root_url
    end
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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:content, :user_id, :law_id)
    end
end
