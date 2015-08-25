class PostPolicy<ApplicationPolicy
    def index?
        true
    end
    
    def show?
    return user.admin? || user.moderator? || record.user == user
  end


  class Scope < Scope
    def resolve
      if !user
        scope.none
      elsif user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user => user)
      end
    end
  end
 end 
