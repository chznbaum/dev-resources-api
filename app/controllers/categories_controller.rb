class CategoriesController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  before_action :set_category, only: [:show, :update]

  def index
    @categories = Category.all
    render json: { status: 'Success', message: 'Loaded all categories.', data: @categories }, status: :ok
  end

  def show
    render json: { status: 'Success', message: "Loaded resources from category #{@category.name}.", data: @category.as_json(include: :resources)}, status: :ok
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      response = { message: 'Category created successfully.' }
      render json: response, status: :created
    else
      render json: @category.errors, status: :bad
    end
  end

  def update
    @category.update(category_params)
    if @category.save
      response = { message: 'Category updated successfully.' }
      render json: response, status: :updated
    else
      render json: @category.errors, status: :bad
    end
  end

  private

  def set_category
    @category = Category.includes(:resources).find_by_name(params[:name]) if params[:name]
    @category = Category.includes(:resources).find_by_id(params[:id]) if params[:id]
    render json: { nothing: true }, status: :not_found unless @category.present?
  end

  def category_params
    params.permit(
      :name, 
      :description
    )
  end
end