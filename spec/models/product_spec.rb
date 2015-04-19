require 'rails_helper'

describe Product do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to ensure_length_of(:name).is_at_least(3).is_at_most(30) }

end
