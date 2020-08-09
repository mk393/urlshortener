class PagesController < ApplicationController
    def index
        
        path = request.path

        redirectto = nil

        if path.start_with?("/u")
            pathsplit = path.split("/")
            if (pathsplit.count > 2)
                url = Url.find_by(s_url: pathsplit[2], active: true)

                if (url != nil)
                    redirectto = url.o_url
                end
            end
        end


        if redirectto.nil?
            render json: {message: "no url found"}
        else
            if redirectto.start_with?("http")
                redirect_to redirectto
            else
                redirect_to "http://" + redirectto
            end
        end

    end
  end