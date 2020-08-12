class BlogsController < ApplicationController
  before_action :set_blog, except: [:index, :new, :create]

  def index
    if params[:term]
      @blogs = Blog.search(params[:term])
    else
      @blogs = Blog.sorted_published_blogs
    end
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end
  
  private
    def set_blog
      @blog = Blog.find_by_id(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :published_date)
    end

end
