class CompaniesController < BaseController
  def show
    @company = Company.friendly.find(params[:id])
    @company_events = @company.events.all.page(params[:page])
    @advertising = Advertising.page_event
  end
end
