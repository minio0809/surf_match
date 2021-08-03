class PostsController < ApplicationController
  
  
  def new
    @post = Post.new
   
  end
  
  
  def create 
    @post = Post.new(post_params)
    if @post.save 
      
      redirect_to posts_path
    else 
      logger.debug("================= image error = #{@post.errors.messages[:images]}" )
      render :new 
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    if params[:id].present?
      @user = User.find(params[:id])
      @posts = @user.posts.order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
    
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
    
  end
  
  def destroy 
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path
  end
  
  def favorite 
    @post = Post.find(params[:id])
    current_user.toggle_like!(@post)
    redirect_to post_path(@post)
  end
  
  private 
    def post_params
      params.require(:post).permit(:title, :content, {images: []}, :movie, :user_id).merge(user_id: current_user.id)
    end
  
end
