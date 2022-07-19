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
FactoryBot.define do
  factory :taco do
    meat {['chicken', 'steak'].sample}
    salsa {[true, false].sample}
    rice {[true, false].sample}
    cheese {[true, false].sample}
    notes {Faker::Lorem.sentence}
  end
end
