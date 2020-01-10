class BlogsController < ApplicationController
  def index
    @blogs= Blog.all
  end
  
  
  def new
    @blog= Blog.new
  end
  
  def create
    @blog= current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blogs_path, success:"投稿しました"
    else 
      flash.now[:danger]="投稿に失敗しました"
      render :new
    end 
  end
  
  def show
    @blog = Blog.find_by(id: params[:id])
  end
  
  def edit
    @blog = Blog.find_by(id: params[:id])
  end
  
  def update
    @blog= Blog.find_by(id: params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, success:"更新しました"
    else
      flash.now[:danger]
      render :edit
    end  
  end
  
  def destroy
    @blog= Blog.find_by(id: params[:id])
    @blog.delete
    redirect_to blogs_path, success: "削除しました"
  end
    
  
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end