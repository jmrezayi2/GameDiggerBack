class App < ActiveRecord::Base
has_many :app_subs , inverse_of: :app
end


