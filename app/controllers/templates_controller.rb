class TemplatesController < ApplicationController
  def index
  end

  def home
  end

  def template
    render template: "templates/#{params[:path]}", layout: nil
  end
end
