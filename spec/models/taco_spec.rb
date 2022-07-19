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
require 'rails_helper'

RSpec.describe Taco, type: :model do
  it 'is valid with valid attributes' do
    taco = FactoryBot.build(:taco)
    expect(taco).to be_valid
  end
  it 'is not valid without a meat' do
    taco = FactoryBot.build(:taco, meat: nil)
    expect(taco).to_not be_valid
  end
  it 'is not valid with an invalid meat' do
    taco = FactoryBot.build(:taco, meat: 'fish')
    expect(taco).to_not be_valid
  end
end
