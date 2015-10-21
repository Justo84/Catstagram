class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    # Building a new Post off of the current_user will use some Rails magic to set up the association between the new Post and the User for us.
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to_root_path, notice: "Post creatd successfully."
    else
      flash.now[:notice] = "There were some errors with your Post."
      render :new
    end
end
