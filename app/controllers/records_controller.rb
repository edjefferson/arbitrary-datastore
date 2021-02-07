class RecordsController < ApplicationController
  def create
    if params["record"] && params["project_id"]
      Record.create(project_id: params["project_id"],json_field: params["record"].to_json)
    end
    render :json => ["egg"]

  end

  def retrieve
    if params["offset"]
      records = Record.where("id < #{params["offset"]}").order(id: :desc).limit(100)

    else
      records = Record.order(id: :desc).limit(100)
    end
    render :json => records
  end
end
