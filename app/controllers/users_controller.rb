class UsersController < ApplicationController

  def login

  end

  def login_session

    user = User.find_by(email: params[:email])
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:notice] =  "로그인 되었습니다."
        redirect_to '/'
      else
        flash[:alert] ="비밀번호가 틀렸습니다."
        redirect_to '/login'
      end
    else
      flash[:alert] = "회원정보가 없습니다."
      redirect_to '/signup'
    end
  end

  def logout
    session.clear
    redirect_to '/'
  end

  def signup

  end

  def register
    User.create(
      email: params[:email],
      password: params[:password]
    )
    redirect_to '/'
  end
end
