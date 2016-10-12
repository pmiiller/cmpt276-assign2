class Tokimon < ActiveRecord::Base
end

class Trainer < ActiveRecord::Base
  has_many :tokimons
end
