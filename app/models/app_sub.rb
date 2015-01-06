class AppSub < ActiveRecord::Base
belongs_to :app, inverse_of: :app_subs , dependent: :destroy
belongs_to :sub, inverse_of: :app_subs , dependent: :destroy
end
