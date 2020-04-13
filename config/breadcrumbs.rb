#ルート
crumb :root do
  link "フリマ", root_path
end

#----------------------------------マイページ--------------------------------#
crumb :mypage do
  link "マイページ", mypage_index_path
end

# 会員情報
crumb :mypage_accounts do
  link '会員情報', mypage_accounts_edit_path
  parent :mypage
end

# 発送元・お届け先住所変更
crumb :mypage_sending_destinations do
  link '発送元・お届け先住所変更', mypage_sending_destinations_edit_path
  parent :mypage
end

# クレジットカード情報
crumb :mypage_cards_index do
  link '支払い方法', mypage_cards_index_path
  parent :mypage
end

# クレジットカード情報入力
crumb :mypage_cards_new do
  link 'クレジットカード情報入力', mypage_cards_new_path
  parent :mypage_cards_index
end

# ログアウト
crumb :mypage_logout do
  link 'ログアウト', logout_mypage_index_path
  parent :mypage
end
#----------------------------------商品関連-------------------------------#
#商品関連ページ実装後に作成


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).