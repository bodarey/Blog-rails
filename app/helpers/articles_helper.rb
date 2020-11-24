module ArticlesHelper


def link_for_edit? article

if current_user 
  article.user_id==current_user.id
end
 end


end




