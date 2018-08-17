module Authors
 class LessonsController < AuthorController
   before_action :set_lesson, only: [:show, :edit, :update, :destroy, :publish, :unpublish]

   # GET /lessons
   # GET /lessons.json
   def index
     @lessons = current_author.lessons.most_recent
   end

   # GET /lessons/1
   # GET /lessons/1.json
   def show
   end

   # GET /lessons/new
   def new
     @lesson = current_author.lessons.new
   end
   def publish
     @lesson.publish
     redirect_to authors_lessons_url
   end
   def unpublish
     @lesson.unpublish
     redirect_to authors_lessons_url
   end
   # GET /lessons/1/edit
   def edit
   end

   # POST /lessons
   # POST /lessons.json
   def create
     @lesson = current_author.lessons.new(lesson_params)

     respond_to do |format|
       if @lesson.save
         format.html { redirect_to authors_lesson_path(@lesson), notice: 'Lesson was successfully created.' }
         format.json { render :show, status: :created, location: @lesson }
       else
         format.html { render :new }
         format.json { render json: @lesson.errors, status: :unprocessable_entity }
       end
     end
   end

   # PATCH/PUT /lessons/1
   # PATCH/PUT /lessons/1.json
   def update
     respond_to do |format|
       if @lesson.update(lesson_params)
         format.html { redirect_to authors_lesson_path(@lesson), notice: 'Lesson was successfully updated.' }
         format.json { render :show, status: :ok, location: @lesson }
       else
         format.html { render :edit }
         format.json { render json: @lesson.errors, status: :unprocessable_entity }
       end
     end
   end

   # DELETE /lessons/1
   # DELETE /lessons/1.json
   def destroy
     @lesson.destroy
     respond_to do |format|
       format.html { redirect_to authors_lessons_url, notice: 'Lesson was successfully destroyed.' }
       format.json { head :no_content }
     end
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_lesson
       @lesson = current_author.lessons.friendly.find(params[:id])
     end

     # Never trust parameters from the scary internet, only allow the white list through.
     def lesson_params
       params.require(:lesson).permit(:title, :body, :description, :banner_image_url, :all_categories)
     end
 end

end
