# == Schema Information
#
# Table name: tacos
#
#  id         :bigint           not null, primary key
#  meat       :string
#  rice       :boolean          default(FALSE)
#  salsa      :boolean          default(FALSE)
#  cheese     :boolean          default(FALSE)
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Taco < ApplicationRecord

validates :meat, inclusion: { in: %w(chicken steak beef),
    message: "%{value} is not a valid meat" }

end
