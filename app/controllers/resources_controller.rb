class ResourcesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_resource, only: [:show, :update]

  def index
    @resources = Resource.all
    render json: { status: 'Success', message: 'Loaded all resources.', data: @resources }, status: :ok
  end

  def show
    render json: { status: 'Success', message: "Loaded resource: #{@resource.name}.", data: @resource }
  end

  def create
    @resource = Resource.create(resource_params)
    if @resource.save
      response = { message: 'Resource created successfully.' }
      render json: response, status: :created
    else
      render json: @resource.errors, status: :bad
    end
  end

  def update
    @resource.update(resource_params)
    if @resource.save
      response = { message: 'Resource updated successfully.' }
      render json: response, status: updated
    else
      render json: @resource.errors, status: :bad
    end
  end

  private

  def set_resource
    @resource = Resource.find_by_name(params[:name]) if params[:name]
    @resource = Resource.find_by_id(params[:id]) if params[:id]
    render json: { nothing: true }, status: :not_found unless @resource.present?
  end

  def resource_params
    params.permit(
      :name, 
      :url,
      :credit, 
      :description,
      :category_id
    )
  end
end