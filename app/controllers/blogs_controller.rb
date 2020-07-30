class BlogsController < ApplicationController

  def index
    if params[:term]
      @blogs = Blog.search(params[:term])
    else
      @blogs = Blog.sorted_published_blogs
    end
  end
end
