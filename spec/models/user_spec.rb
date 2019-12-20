require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User' do 
    user = User.new
    user.password_digest = "password"
    it 'Can create user' do
      expect(!!user).to eq(true)
    end
    it 'Password is encrypted' do
      expect(user.password).not_to eq('password')
    end
  end
end
