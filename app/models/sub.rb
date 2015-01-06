class Sub < ActiveRecord::Base
has_many :app_subs, inverse_of: :sub
end
