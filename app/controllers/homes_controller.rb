class HomesController < ApplicationController
    def index
        if current_interpreter
            if Address.find_by_interpreter_id(current_interpreter.id).nil?
                redirect_to new_address_path
            end
        end
    end

    def no_page
    end
end
