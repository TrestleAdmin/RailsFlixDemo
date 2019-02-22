class MediaController < ApplicationController
protected
  def paginate(klass)
    klass.page(params[:page]).per(10)
  end
end
