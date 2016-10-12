class Trainer < ActiveRecord::Base
end

class Tokimon < ActiveRecord::Base
  belongs_to :trainer
end
