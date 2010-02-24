class FeedsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :js, :only => :new
  def begin_of_association_chain
    current_user
  end
  def destroy
    destroy! { root_url }
  end
  def create
    create! { root_url }
  end
  def refresh
    current_user.load_all_feeds!
    redirect_to root_url
  end
end
