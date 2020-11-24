module CommentsHelper

  def link_for_edit_comment? comment
if current_user
  comment.user_id==current_user.id 
  end

end
end
