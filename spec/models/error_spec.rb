require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it 'passwordは、半角数字のみでは登録できない' do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      binding.pry
    end
  end
end

# def array123(nums)
#   if nums.include?(1) && nums.include?(2) && nums.include?(3)
#     puts "True"
#   else
#     puts "False"
#   end
# end

#   def array123(nums)
#     if nums.include?(1&&2&&3) 
#       puts "True"
#     else
#       puts "False"
#     end
#   end
#   array123([1, 1, 2, 3, 1])
#   array123([1, 1, 2, 4, 1])
#   array123([1, 1, 2, 1, 2, 3])
#   array123([1, 1, 4, 1, 5, 3])
#   array123([1, 1, 4, 1, 5, 2])

