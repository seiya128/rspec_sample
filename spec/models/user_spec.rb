require 'rails_helper'

# Modelのテストはバリデーションのテストだと思っていい
RSpec.describe User, type: :model do

	describe "userモデルバリデーション" do
		it "直書き：nameが空白ではない場合エラーにならないこと" do
			user = User.new(
				name: "user_name",
				)
			# be_validはvalidが走る
			expect(user).to be_valid
		end

		it "直書き：nameは空白でエラーとなること" do
			user = User.new(
				name: "",
				)
			# to_notまたはnot_toで否定
			expect(user).to_not be_valid
		end

		# テストデータを何度も書かなくて済むようにFactoryGirlを使った場合
		it "FactoryGirl：nameが空白ではない場合エラーにならないこと" do
			user = FactoryGirl.build(:user)
			expect(user).to be_valid
		end

		it "FactoryGirl：nameは空白でエラーとなること" do
			fail_user = FactoryGirl.build(:fail_user)
			expect(fail_user).to_not be_valid
		end

	end

end
