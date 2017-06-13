require 'rails_helper'

RSpec.describe UserListController, type: :controller do

	describe "GET index" do
		before do
	      get :index
	    end

		it "ページを正常に表示すること" do
		  	expect(response).to be_ok
  			# be_ok # 200
			# be_success # 200番台
			# be_successful # 200番台
			# be_redirect # 301, 302, 303, 307のどれか
			# be_forbidden # 403
			# be_not_found # 404
			# be_missing # 404

			# ステータスを指定するやり方もある
  			expect(response).to have_http_status 200
  			# expect(response).to have_http_status(:success)
		end

		it "テンプレートが正しく使われていること" do
			expect(response).to render_template :index
		end
	end

	describe "GET save" do
		it "正しい情報がパラメータで渡った場合、登録できてリダイレクトされていること" do
			get :save, params: {name: "test_user"}
		  	expect(response).to redirect_to "/user_list/index"
		end
		it "間違った情報がパラメータで渡った場合、エラーページにリダイレクトされていること" do
			get :save
			expect(response).to redirect_to "/user_list/error"
		end
	end

end
