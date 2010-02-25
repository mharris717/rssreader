require 'andand'
class FeedsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :js, :only => :new
  def begin_of_association_chain
    current_user
  end
  def destroy
    params[:id] = params[:feed].andand[:id] if params[:id].blank? || params[:id] == 'destroy'
    destroy! { root_url }
  end
  def create
    create! do
      @feed.load_feed!
      root_url
    end
  end
  def refresh
    current_user.load_all_feeds!
    redirect_to :controller => 'posts', :action => 'index'
  end
end
