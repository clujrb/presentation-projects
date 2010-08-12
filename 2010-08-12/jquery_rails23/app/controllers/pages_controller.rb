class PagesController < ApplicationController
  def hello
    respond_to do |format|
      format.js {
        render :json  => {
          :greeting         => "Hello, JSON!",
          :complex_greeting => render_to_string(:partial => "hello")
        }
      }
    end
  end
end
