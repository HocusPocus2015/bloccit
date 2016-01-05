module UsersHelper
  def show
    if @user.posts == 0 || @user.comments == 0
      "{user.name} has not submitted any posts or comments yer."
    else
      @user = User.find(params[:id])
      @posts = @user.posts.visible_to(current_user)
      @comments = @user.comments.visible_to(current_user)
    end
  end
end


     # link_to @posts = @user.posts.visible_to(current_user)
     # link_to @comments = @user.comments.visible_to(current_user)
