module WelcomeHelper
  def fetch_categories
    @categories_header = Category.where(is_active: true)
  end
end
