require 'digest/md5'

module Api
    module V1
       class UrlsController < ApplicationController
            def index
                head :no_content
            end

            def show 
                head :no_content
            end

            def create
                user = User.find_by(token: request.headers["token"])

                if user.nil?
                    render json: {message: "Unauthorized to create short url."}
                else
                    url = Url.new(urls_params)
                    url.user_id = user.id
                    url.active = 1
                    if url.s_url.nil?
                        i = 0;
                        short_url = nil
                        
                        while short_url.nil? do
                            short_url = Digest::MD5.hexdigest(url.o_url + user.id.to_s +  "seed" + i.to_s)  
                            short_url = short_url[0..6]

                            urlexists = Url.find_by(s_url: short_url)
                            
                            if (urlexists != nil)
                                short_url = nil
                                i +=1
                            end

                        end

                        url.s_url = short_url
                    end
                
                    
                    if url.save
                        render json: {o_url: url.o_url, s_url: "localhost:3000/u/" + url.s_url}
                    else
                        render json: errors(url), status: 422
                    end
                end
            end

            def update
                user = User.find_by(token: request.headers["token"])

                if user.nil?
                    render json: {message: "Unauthorized to create short url."}
                else
                    urlToUpdate = Url.new(url_update_param)
                    
                    urlexists = Url.find_by(s_url: urlToUpdate.s_url, user_id: user.id)

                    if urlexists.nil?
                        render json: errors(url), status: 422
                    else
                        urlexists.active = urlToUpdate.active

                        if urlexists.update(active: urlToUpdate.active)
                            render json: {s_url: "localhost:3000/u/" + urlexists.s_url, active: urlexists.active}
                        else
                            render json: errors(url), status: 422
                        end
                    end
                end
            end

            def destory
                head :no_content   
            end

            private

            def urls_params
                params.require(:url).permit(:o_url, :s_url)
            end

            def url_update_param
                params.require(:url).permit(:s_url, :active)
            end
       end 
    end
end