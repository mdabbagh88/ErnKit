require 'sinatra'

module DemoServer
    class App < Sinatra::Base
        configure do
            set :show_exceptions, false
        end

        error do
            'Error'
        end

        before do
            #chace for 600s = 10 min
            cache_control :public, :must_revalidate, :max_age => 600
        end

        get '*/:folder_name/:file_name' do
            content_type :json
            read_file("#{params[:folder_name]}/#{params[:file_name]}.json")
        end

        def read_file(filename)
            full_file_path = "DemoServer/#{filename}"
            if (!File.file?(full_file_path))
                puts "Could not find: #{full_file_path}"
                raise Sinatra::NotFound
            end
            File.read(full_file_path)
        end
    end
end
