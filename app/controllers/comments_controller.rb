class CommentsController < ApplicationController
  def create # POST  posts/:post_id/comments
    @post = Post.find(params[:post_id]) # First we need to find the post in order to create the comment
    @comment = @post.comments.build(comment_params) # Create a comment instance to next save it

    if @comment.save
      redirect_to post_path(@post), notice: 'Se ha creado el comentario'
    else
      redirect_to post_path(@post), notice: 'No se pudo crear el comentario'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end