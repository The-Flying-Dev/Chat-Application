module ApplicationCable
  class Connection < ActionCable::Connection::Base
    #identify Cable connection with the browser session ID
    identified_by :session_id

    def connect 
      self.session_id = request.session.id
    end
  end
end
