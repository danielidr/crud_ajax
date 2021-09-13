class PostsController < ApplicationController
    
    def index
        @posts = Post.all
    end

    def show

    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        respond_to do |format|
            if @post.save
                format.js {render nothing: true, notice: 'Post was successfully created.'}
            end
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |format|
            format.js { render nothing: true, notice: "Post was successfully destroyed." }
        end
    end
    
    def update
        @post = Post.find(params[:id])
        respond_to do |format|
            if @post.update(post_params)
                format.js { render nothing: true, notice: "Post was successfully updated." }
                format.json { render :show, status: :created, location: @post }
            end
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end