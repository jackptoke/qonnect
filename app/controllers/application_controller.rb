class ApplicationController < ActionController::Base
    protected
    def authenticate_user
        begin
            unless current_interpreter || current_client
                raise AuthenticationError.new()
            end
        rescue => exception
            redirect_to root_path, :flash => { :error => "Insufficient rights!" }
        end
    end

end
