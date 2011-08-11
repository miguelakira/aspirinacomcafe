

class PostsController < ApplicationController


before_filter :reviews

  def index
  	@posts = Post.all( :conditions => { :published => true } )
    @reviews = Post.all( :conditions => { :published => true } )
    @reviews.each do |review|
      title_array = review.title.split(" ")
      title_array = title_array[2, title_array.count]
      review.title = title_array.join(" ")
    end
  end

  def reviews
    @reviews = Post.all( :conditions => { :published => true } )
    @reviews.each do |review| unless @reviews.nil?
      title_array = review.title.split(" ")
      title_array = title_array[2, title_array.count]
      review.title = title_array.join(" ")
  end  
  end
  end

  def edit
    @post = Post.find_by_id(params[:id])

  end

  def new
    
    @post = Post.new
    
  end

  def delete
  end

  def show
  end

  def update
    
    @post = Post.find(params[:id])


    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  


  def create
    @post = Post.new(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

end
