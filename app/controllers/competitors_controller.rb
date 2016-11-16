class CompetitorsController < ApplicationController
  def create
    email = params[:competitor][:email]
    score = params[:competitor][:score]. to_i
    competitor = Competitor.find_by_email(email)

    if competitor
      competitor.update(competitor_params) if competitor.score < score
    else
      redirect_to competotirs_path
  end

  def index
    @competitors = Competitor.all.order(score: :desc).limit(10)
end

private

def competitor_params
  params.require(:competitor).permit(:email, :score)
end
end
