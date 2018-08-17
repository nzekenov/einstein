module Blog
  class LessonsController < BlogController
    def index
      @lessons = Lesson.most_recent.published.paginate(:page => params[:page], per_page: 9)
    end
    def show
      @lesson = Lesson.friendly.find(params[:id])
    end
  end

end
