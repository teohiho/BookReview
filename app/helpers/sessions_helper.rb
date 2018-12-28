module SessionsHelper

      def log_in user
        session[:user_id] = user.id
      end

      def log_out
        session.delete :user_id
      end
    # Returns the current logged-in user (if any).
      def current_user
        @current_user ||= User.find_by id: session[:user_id]
      end

    # Check user has logged in before ? 
      def logged_in?
        current_user.present?
      end
      
      def require_login
          unless logged_in?
           flash[:danger] = "bạn phải truy cập trước khi thực hiện tác vụ này !" 
           redirect_to login_path
          end
      end

      def require_admin
          unless admin?
          flash[:warning] = "bạn không có quyền thực hiện tác vụ này !"  
          redirect_to root_path     
          end
      end   
      
      def admin?
          if logged_in?
              current_user.admin 
          else 
             return false    
          end
      end 

    end