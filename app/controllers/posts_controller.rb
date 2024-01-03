
class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
# ========================




def comments
  # post = Post.find(params[:id])
  # comments = post.comments

  render json: comments, status: :ok
rescue ActiveRecord::RecordNotFound
  render json: { error: 'Post not found' }, status: :not_found
end




# =======================
    def index
      @posts = Post.all
      render json: @posts,status: :ok
    #  @posts = Post.includes(:comments,:author)
    #  render json: @posts.as_json(include: { comments: {},author:{} }), status: :ok
    end
  
    def show
      @post = Post.find(params[:id])
      render json: @post,status: :ok
      # comment = post.comments.find(params[:comment_id])

      # render json: comment, status: :ok
    end
  
    def new
      @post = Post.new
      render json: @post,status: :ok

    end
  
    def create
     
      @post = Post.new(post_params)
      render json: @post,status: :created
  
      if @post.save
        # redirect_to posts_path
      else
        # render json: @post.errors, status: :unprocessable_entity

      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end
  
    def update
      @post = Post.find(params[:id])
  
      if @post.update(post_params)
        render json: @post,status: :ok


        # redirect_to posts_path
      else
        render :edit
      end
    end
  
    def destroy
      @post = Post.find(params[:id])
     
      render json: @post,status: :no_content

      if @post.destroy
        # redirect_to posts_path
      else
        render :index
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :author_id,:image)
    end
  end
  