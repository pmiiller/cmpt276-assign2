class Person < ActiveRecord::Base
end

class Thing < ActiveRecord::Base
  belongs_to :person
end
