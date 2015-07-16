class PagesController < ApplicationController
  def index
  	@forms = Form.all
  end

  def about
  end
end
