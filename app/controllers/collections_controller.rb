class CollectionsController < ApplicationController
  def new
    @collection = Collection.new
  end
  def create
    @collection = Collection.create(collection_params)
  end
  private
  def collection_params
    params.require(:collection).permit(:book_id, :user_id)
  end
end
