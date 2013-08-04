
task :default => [:test]

desc "Build libraries and demo app"
task :build do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit -sdk iphonesimulator build"
end

desc "Build libraries and run oclint"
task :oclint do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit -sdk iphonesimulator -reporter json-compilation-database:compile_commands.json build;oclint-json-compilation-database"
end

desc "Run unit tests for libraries"
task :test do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit -sdk iphonesimulator test"
end

desc "Clean"
task :clean do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit -sdk iphonesimulator clean"
end

namespace :server do
    desc "Start demo server"
    task :start => :stop do
        puts 'Starting the demo server...'
        system('thin start -p 3333 -a 127.0.0.1 -l tmp/stubServer.log -R DemoServer/config.ru -d')
    end

    desc "Restart demo server"
    task :restart do
        exec('thin restart -R DemoServer/config.ru -d')
    end

    desc "Stop demo server"
    task :stop do
        begin
            puts 'Stopping the demo server...'
            verbose(false) do
                system('thin stop -q > /dev/null')
            end
        rescue
        end
    end
end

