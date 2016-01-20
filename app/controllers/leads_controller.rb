class LeadsController < ApplicationController

  def index
    @leads = []
    if params[:q1].nil? == false

      if params[:q1] == "" && params[:q2] == "" && params[:q3] == "" && params[:q4] == "" && params[:q5] == ""
        flash[:error] = "At least one field must be filled!"
        render :index
      else
        @leads = search(params[:q1],
                        params[:q2],
                        params[:q3],
                        params[:q4],
                        params[:q5]
                       )
      end
    end
  end

  def show

  end

  def search(q1, q2, q3, q4, q5)
    results = nil
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
    results = Lead.where(query, *vars)
  end
end
