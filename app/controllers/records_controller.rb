class RecordsController < ApplicationController
  def create
    if params["record"] && params["project_id"]
      Record.create(project_id: params["project_id"],json_field: params["record"].to_json)
    end
    render :json => ["egg"]

  end

  def retrieve
    if params["offset"] && params["project_id"]
      records = Record.where(project_id: params["project_id"].to_i).where("id < #{params["offset"]}").order(id: :desc).limit(100)
    elsif params["project_id"]
      records = Record.where(project_id: params["project_id"].to_i).order(id: :desc).limit(100)
    end
    render :json => records
  end
end
