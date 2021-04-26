require 'rails_helper'

RSpec.describe User, type: :model do

  # subject { described_class.new(username: "Anything", email: "Anything@test.com",
  #                               password: "Anything") }
                                

  # it "is valid with valid attributes" do
  #   expect(subject).to be_valid
  # end

  # it "is not valid without a username" do
  #   subject.username = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a email" do
  #   subject.email = nil
  #   expect(subject).to_not be_valid
  # end

  # it "is not valid without a password" do
  #   subject.password = nil
  #   expect(subject).to_not be_valid
  # end

  # context 'when email is not unique' do
  #   before {described_class.create!(username: "test1", email: "Anything@test.com",
  #     password: "Anything")}
  #     it {expect(subject).to_not be_valid}
  # end

  # context 'when username is not unique' do
  #   before {described_class.create!(username: "Anything", email: "test1@test.com",
  #     password: "Anything")}
  #     it {expect(subject).to_not be_valid}
  # end

  describe "Validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_uniqueness_of(:username) }
    it { should validate_confirmation_of(:password) }
  end

  describe "Associations" do
    it { should have_many(:yweets)}
    it { should have_many(:likes)}
  end

end
