crumb :root do
  link "TOP ", root_path
end

crumb :show do
  link " マイページ", user_path
end

crumb :myproduct do
  link " 出品した商品 - 出品中", myproduct_product_path
  parent :show
end

crumb :profile do
  link " プロフィール", profile_user_path
  parent :show
end

crumb :user_info_register do
  link " 本人情報の登録", user_info_register_user_path
  parent :show
end

crumb :logout do
  link " ログアウト", logout_user_path
  parent :show
end

crumb :edit do
  link " 支払い方法", edit_user_path
  parent :show
end