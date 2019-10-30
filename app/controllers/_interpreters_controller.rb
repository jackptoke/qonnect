class InterpretersController < ApplicationController
    def index
    end
    def address
    end
    
    private
    def set_address
        id = current_interpreter.address.id
        @address = Address.find(id)
      end
end
