class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_post, except: [:index, :new, :create]
  
  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post)
  end

  def new
    @post = Post.new
  end
  
  def create
    # @post = Post.new
    # @post.title = params[:title]
    # @post.content = params[:content]
    # @post.save
    
    Post.create(post_params)
    # @post.user_name = current_user.email
    # @post.save
    
    redirect_to posts_path
  end

  def edit
    # @post = Post.find(params[:id])
  end
  
  def update
    # @post = Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to post_path(@post)
    # #{}를 사용할 때는 무조건 큰 따옴표로 묶여야 함
  end
  
  def destroy
    # @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
  
  # def create_comment
  #   @post = Post.find(params[:id])
  #   @post.comments.create(content: params[:comment_content])
    
  #   redirect_to "/posts/show/#{@post.id}"
  # end
  
  
  private
  def find_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    post_params = params.require(:post).permit(:title, :content, :user_name)
  end
end
