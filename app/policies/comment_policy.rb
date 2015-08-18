class CommentPolicy < ApplicationPolicy
    def new?
+    create?
+  end
+
+  def create?
     user.present? && user.admin?
   end
 end 
