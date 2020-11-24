class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :get_article
#####################################################  
  def new
@comment=Comment.new
  end
#####################################################
  def create

    @comment=@article.comments.new comment_params
    @comment.user_id=current_user.id
    if @comment.save
      redirect_to  article_comment_path(@article,@comment), notice: 'Comment successfully created!'
    else 
      render :edit
    end
  end
#####################################################
  def edit
      @comment = @article.comments.find params[:id]

  end
#####################################################
  def show
    @comment = @article.comments.find params[:id]
  end
#####################################################
  def update
@comment=@article.comments.find params[:id]
if @comment.update comment_params

flash[:notice]="Comment successfully updated!"
redirect_to article_comment_path(@article,@comment)
else
  render :edit
end
  end
#####################################################


  def destroy
 @comment=@article.comments.find params[:id]
  if @comment.destroy
    flash[:alert]="Comment successfully deleted!"
  redirect_to  @article
  else 
    render :show
  end
end
#####################################################
  def index
  end
#####################################################
  private
  def comment_params
params.require(:comment).permit(:user_name,:body)
end


  def get_article
@article=Article.find params[:article_id]
  end
#####################################################
end
