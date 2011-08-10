class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def edit
  end

  def new
  end

  def delete
  end

  def news
  	@news = Post.all.last(5).reverse
  end
end
