class PostsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :js, :only => :index
  def begin_of_association_chain
    current_user
  end
  def show
    @post = Post.find(params[:id])
    @post.update_attributes(:read => true)
  end
end
