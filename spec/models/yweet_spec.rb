require 'rails_helper'

RSpec.describe Yweet, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:yweet)}
  end

  describe "Associations" do
    it { should belong_to(:user)}
    it { should have_many(:likes)}
  end
end
