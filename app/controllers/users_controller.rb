class UsersController < ApplicationController  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # 登録完了時にメール送信
      UserMailer.with(to: @user.email, name: @user.name).welcome.deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
