class ResourcesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_resource, only: [:show, :update]

  include JsonResponder

  def index
    @resources = Resource.all
    render json: { status: 'Success', message: 'Loaded all resources.', data: @resources }, status: :ok
  end

  def show
    render json: { status: 'Success', message: "Loaded resource: #{@resource.name}.", data: @resource }
  end

  def create
    @resource = Resource.create(resource_params)
    json_response('Resource', @resource, 'create')
  end

  def update
    @resource.update(resource_params)
    json_response('Resource', @resource, 'update')
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