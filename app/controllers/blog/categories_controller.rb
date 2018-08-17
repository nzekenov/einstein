module Blog
  class CategoriesController < ApplicationController
    def show
      @category = Category.find_by(name: params[:id])
      @lessons = @category.lessons
    end
  end
end
