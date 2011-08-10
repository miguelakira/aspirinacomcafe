class PostsController < ApplicationController
  def index
  	@posts = Post.all( :conditions => { :published => true } )
    @reviews = @posts
    @reviews.each do |review|
      title_array = review.title.split(" ")
      title_array = title_array[2, title_array.count]
      review.title = title_array.join(" ")
    end
  end

  def reviews
    
    
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def delete
  end

  def show
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

end
