class CompaniesController < BaseController
  def show
    @company = Company.find(params[:id])
    @company_events = @company.events.all
  end
end
