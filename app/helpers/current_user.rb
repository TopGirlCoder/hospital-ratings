helpers do

  def current_user
    @current_user ||= @user.find(sessions[:id]) if sessions[:id]
  end

end
