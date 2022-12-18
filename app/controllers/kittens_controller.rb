class KittensController < ApplicationController
  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html
      format.json {render json: @kittens}
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @kitten }
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def create
    @kitten = Kitten.new(app_params)
    
   if @kitten.save
    redirect_to @kitten, notice: "Cat succesfully added!"
   else
    render :new, status: :unprocessable_entity
   end
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(app_params)
      redirect_to @kitten, notice: "Cat succesfully edited!"
     else
      render :edit, status: :unprocessable_entity
     end
  end

  def destroy
    @kitten = @kitten = Kitten.find(params[:id])
    @kitten.destroy
    redirect_to root_path, notice: "Data is succesfully deleted."
  end

  private

  def app_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
