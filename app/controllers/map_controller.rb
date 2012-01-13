class MapController < ApplicationController
  def index
    @images = Image.all
  end
end
