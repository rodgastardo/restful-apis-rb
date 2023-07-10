class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  #before_action :ensure_json_request

  def ensure_json_request
    if request.headers['Accept'] =~ /vnd\.api\+json/
      unless request.get?
        return if request.headers['Content-Type'] =~ /vnd\.api\+json/

        render nothing: true, status: 415
      end
    else
      render nothing: true, status: 406
    end
  end
end
