class Api::V1::WorksController < ApplicationController
  def index
    works = Work.all.includes([:work_steps])
    render json: WorkResource.new(works).serialize
  end
end
