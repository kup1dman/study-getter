class Subject < ActiveRecord::Base
  belongs_to :order, optional: true
end
