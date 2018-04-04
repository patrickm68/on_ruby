class SessionsController < ApplicationController
  def offline_login
    user = User.find_by_nickname(params[:nickname])
    sign_in(user)

    redirect_to root_path, notice: 'Offline Login!'
  end

  def create
    begin
      authorization = Authorization.handle_authorization request.env['omniauth.auth']
      sign_in(authorization.user)
      options = { notice: t('flash.logged_in', name: current_user.name) }
    rescue User::DuplicateNickname => error
      options = { alert: t('flash.duplicate_nick', name: error.nickname) }
    end

    redirect_to request.env['omniauth.origin'] || root_path, options
  end

  def destroy
    sign_out

    redirect_to root_path, notice: flash[:notice] || t('flash.logged_out')
  end

  def failure
    redirect_to root_path, alert: t('flash.login_error')
  end

  def auth
    session[:omniauth_keys] = Usergroup.omniauth_keys(params[:provider], request)

    redirect_to "/auth/#{params[:provider]}"
  end
end
