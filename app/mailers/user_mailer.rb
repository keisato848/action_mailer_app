class UserMailer < ApplicationMailer
  def welcome
    # コントローラーのparamsと同じ要領で取得できる
    @name = params[:name]
    mail(to: params[:to], subject: '登録完了')
  end
end
