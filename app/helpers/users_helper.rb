module UsersHelper
    def image_selector(user)
    if(user.avatar_file_name)
      user.avatar
    else
      user.picture
    end
  end

  # def sort_users_by_points(users)
  #   users.sort! { |a,b| a.bank.balance <=> b.bank.balance } 
  # end

  def authenticate_user
    if current_user
        true
    else
      redirect_to signin_path
    end
  end
end
