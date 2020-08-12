class BlogsController < ApplicationController
  before_action :set_blog, except: [:index, :new, :create]

  def index
    @user = User.find_by_id(params[:user_id])
    if params[:term]
      @blogs = @user.blogs.search(params[:term])
    else
      @blogs = @user.blogs.sorted_published_blogs
    end
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to user_blogs_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to user_blog_path(current_user, @blog)
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to user_blogs_path(current_user)
  end
  
  private
    def set_blog
      @blog = Blog.find_by_id(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :published_date)
    end

end
