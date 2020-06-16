class StaticPagesController < ApplicationController

  def contact
    @user = User.new
  end

end
