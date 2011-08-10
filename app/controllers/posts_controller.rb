class PostsController < ApplicationController
  def index
  	@posts = Post.all( :conditions => { :published => true } )
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def delete
  end

  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
  end
  
  def news
  	@news = Post.all.last(5).reverse
  end
end
