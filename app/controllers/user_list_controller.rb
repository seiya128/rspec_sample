class UserListController < ApplicationController

	# ただUserの全てを表で表示する
	def index
		@user = User.get_new_user()
	end

	# エラーページ
	def error
	end

	# 保存
	def save
		save_name = params[:name]
		# パラメータでnameが渡って来なかった場合はエラーへリダイレクト
		if save_name.blank?
			redirect_to action: 'error'
			return
		end

		user = User.new
		user.name = save_name
		# 保存が成功した場合はindex、失敗した場合はerrorへリダイレクト
		if user.save then
			redirect_to action: 'index'
		else
			redirect_to action: 'error'
		end
  	end
end
