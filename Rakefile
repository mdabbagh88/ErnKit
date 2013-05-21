
task :default => [:test]

desc "Build libraries and demo app"
task :build do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO build"
end

desc "Run unit tests for libraries"
task :test do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO test"
end

desc "Clean"
task :clean do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO clean"
end
