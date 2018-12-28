module BookfavoritesHelper
     def check user
     @bookfavorite = Bookfavorite.where(:user_id => @user.id)
     @id = @bookfavorite
    end
end
