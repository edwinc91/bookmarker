if current_user
  json.current_user do
    json.user_id current_user.id
    json.name current_user.name
  end
else
  json.current_user nil
