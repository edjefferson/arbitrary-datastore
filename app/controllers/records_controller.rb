class RecordsController < ApplicationController
  def create
    if params["record"] && params["project_id"]
      Record.create(project_id: params["project_id"],json_field: params["record"].to_json)
    end
    render :json => ["egg"]

  end

  def retrieve

    limit = params["limit"].to_i ? = params["limit"].to_i ? 100
    if params["offset"] && params["project_id"]
      records = Record.where(project_id: params["project_id"].to_i).where("id < #{params["offset"]}").order(id: :desc).limit(limit)
    elsif params["project_id"]
      records = Record.where(project_id: params["project_id"].to_i).order(id: :desc).limit(limit)
    end
    render :json => records
  end

  def update_tag
    record = Record.find(params["record_id"])
    Tag.where(key: params["tag_key"], value: params["tag_value"]).first_or_create
    record.tags << tag unless record.tags.include?(tag)
  end
end
