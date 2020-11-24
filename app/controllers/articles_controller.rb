class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  #####################################################
  def index
    @articles = Article.all
   
  end
#####################################################  
  def create
      @article = Article.new article_params
      @article.user=current_user
      @article.user_name=current_user.username
 if @article.save
  flash[:notice]="Article successfully created!"
  redirect_to article_path @article
else 
  render 'new'
end
  end
#####################################################
  def new
    @article= Article.new
  end
#####################################################
  def show
    @article =Article.find(params[:id])
    @comments =@article.comments.all
  end
#####################################################
  def edit
@article =Article.find params[:id]
  end
 #####################################################
   def update
    @article =Article.find params[:id]
if @article.update article_params
flash[:notice]="Article successfully updated!"
redirect_to @article
else
  render :edit
end
  end

 ##################################################### 
 def destroy
@article =Article.find params[:id]
@article.destroy
redirect_to articles_path
 end
 ##################################################### 

private
def article_params
params.require(:article).permit(:title,:description,:user_name)
end

end
