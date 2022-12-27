class Api::V1::WorksController < Api::V1::BaseController
  def index
    works = Work.all
    json_str = WorkResource.new(works).serialize
    render json: json_str
  end
end
