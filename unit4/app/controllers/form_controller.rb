class FormController < ApplicationController
  # index route
  def index
    render json: Form.all
  end

  #show route
  def show
    render json: Form.find(params["id"])
  end

  # create route
  def create
    render json: Form.create(params["form"])
  end

  # delete route
  def delete
    render json: Form.delete(params["id"])
  end

  # update route
  def update
    render json: Form.update(params["id"], params["form"])
  end
end
