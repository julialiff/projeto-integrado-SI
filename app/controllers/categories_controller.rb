class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :activate_deactivate]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @pesquisa = params[:pesquisa] ? params[:pesquisa] : ""
    if @pesquisa
      search = '%' + @pesquisa + '%'
      @categories = @categories.where("nome ILIKE ? ", search)
    end
    if params[:active_only]
      @categories = @categories.where(is_active: true)
    end
    if params[:not_active]
      @categories = @categories.where(is_active: false)
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to area_admin_categorias_path, notice: 'Categoria criada com sucesso.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to area_admin_categorias_path, notice: 'Categoria atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Categoria excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  ############################# ADMIN ########################
  def activate_deactivate
    @category.is_active = !@category.is_active
    @category.save
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:nome)
    end
end
