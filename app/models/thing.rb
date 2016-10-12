class Thing < ActiveRecord::Base
end

class Person < ActiveRecord::Base
  has_many :things
end
