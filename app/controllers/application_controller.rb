require 'json'
class ApplicationController < ActionController::API
  def create
    if params["record"] && params["project_id"]
      Record.create(project_id: params["project_id"],json_field: params["record"].to_json)
    end
    render :json => ["egg"]

  end
end
