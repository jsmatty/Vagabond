class PostsController < ApplicationController
    def show
        @city =City.find(params[:city_id])
        @post = Post.find(params[:id])
        @user = User.find(@post.user_id)
    end
    
    def new
        @post = Post.new
    end

    def create
        @city = City.find(params[:city_id])
        @post = @city.posts.create(post_params)
        redirect_to city_path(@city) 
    end
    def edit 
        @post =Post.find(params[:id])
    end

    def update
        @city = City.find(params[:city_id])
        @post = @city.posts.find(params[:id])
        @post.update(post_params)
        redirect_to city_post_path(@post)
    end

    def destroy
        @city = City.find(params[:city_id])
        @post = @city.posts.find(params[:id]) 
        @post.destroy
        redirect_to city_path(@city)
    end
    private
    
      def post_params
        posts = params.require(:post).permit(:title, :description).merge(user_id: current_user.id)
        user_id = { user_id: current_user.id }
        posts
      end
    
end