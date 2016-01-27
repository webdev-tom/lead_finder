class LeadsController < ApplicationController
  def index
    @user = current_user
    @leads = []

    if params[:q1].nil? == false
      if valid_search?
        @leads = search(*search_params)
      else
        flash[:error] = "At least one field must be filled!"
        render :index
      end
    end
  end

  def show
    @user = current_user
    @lead = Lead.find(params[:id])
  end

  def new
    @user = current_user
    @lead = Lead.new
  end

  def create
    @user = current_user
    @lead = Lead.new(lead_params)

    @lead.company_id = create_id

    if @lead.save
      flash[:notice] = "Your lead has been saved to the database, #{@user.first_name}."
      redirect_to lead_path(@lead)
    else
      flash[:errors] = @lead.errors.full_messages.join(". ")
      render :new
    end
  end

  protected

  def lead_params
    params.require(:lead).permit(:company_name,
                                :phys_address,
                                :phys_city,
                                :phys_state,
                                :phys_zip,
                                :description,
                                :phone,
                                :alt_phone,
                                :toll_free_phone,
                                :fax_phone,
                                :website,
                                :email,
                                :mail_address,
                                :mail_city,
                                :mail_state,
                                :mail_zip,
                                :employees_on_site,
                                :annual_sales,
                                :year_est,
                                :area_of_dist,
                                :ownership,
                                :imports,
                                :woman_owned,
                                :minority_owned)
  end

  def valid_search?
    if params[:q1] == "" &&
      params[:q2] == "" &&
      params[:q3] == "" &&
      params[:q4] == "" &&
      params[:q5] == ""

        return false

    else
      return true
    end
  end

  def search_params
    [params[:q1], params[:q2], params[:q3], params[:q4], params[:q5]]
  end

  def create_id
    Time.now.strftime("%H%M%S")
  end

  def search(q1, q2, q3, q4, q5)
    vars = []
    query = ""

    if q1 != ""
      query += "LOWER(company_name) LIKE LOWER(?)"
      vars << '%' + q1 + '%'
    end

    if q2 != ""
      if query == ""
        query += "LOWER(phys_address) LIKE LOWER(?)"
      else
        query += " AND LOWER(phys_address) LIKE LOWER(?)"
      end
      vars << '%' + q2 + '%'
    end

    if q3 != ""
      if query == ""
        query += "LOWER(phys_city) LIKE LOWER(?)"
      else
        query += " AND LOWER(phys_city) LIKE LOWER(?)"
      end
      vars << '%' + q3 + '%'
    end

    if q4 != ""
      if query == ""
        query += "LOWER(phys_state) LIKE LOWER(?)"
      else
        query += " AND LOWER(phys_state) LIKE LOWER(?)"
      end
      vars << '%' + q4 + '%'
    end

    if q5 != ""
      if query == ""
        query += "LOWER(phys_zip) LIKE LOWER(?)"
      else
        query += " AND LOWER(phys_zip) LIKE LOWER(?)"
      end
      vars << '%' + q5 + '%'
    end
    Lead.where(query, *vars).order(company_name: :asc)
  end
end
