class StaticController < ApplicationController
  include BannanaHelper

  def home
    render(layout: "landing_page")
  end
end
