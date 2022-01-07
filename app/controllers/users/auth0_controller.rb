class Users::Auth0Controller < ApplicationController
  def callback
    session[:userinfo] = auth_info["extra"]["raw_info"]
    redirect_to dashboard_path
  end

  def failure
    flash[:alert] = request.params["message"]
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def auth_info
    request.env["omniauth.auth"]
  end

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: Rails.application.credentials.auth0.client,
    }

    uri = URI::HTTPS.build(host: Rails.application.credentials.auth0.domain, path: "/v2/logout", query: to_query(request_params)).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join("&")
  end
end
