class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path(@post), notice: 'Se ha creado un Post'
    else
      flash.now[:notice] = "Hubo un error al tratar de crear el post"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Se ha actualizado un Post'
    else
      flash.now[:notice] = 'Hubo un error al actualizar el Post'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @posts = Post.find(params[:id])
    flash[:notice] = 'Se ha eliminado el post correctamente'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end