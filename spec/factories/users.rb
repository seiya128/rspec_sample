FactoryGirl.define do
	factory :user do
		name "user_name"
	end
	# クラス名以外の名前を定義したい場合の書き方
	factory :fail_user , class: User do
    	name ""
  	end
end
