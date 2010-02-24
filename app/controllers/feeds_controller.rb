class FeedsController < InheritedResources::Base
  before_filter :authenticate_user!
  def begin_of_association_chain
    current_user
  end
  def destroy
    destroy! { root_url }
  end
end
