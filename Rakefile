
task :default => [:test]

task :build do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO build"
end

task :test do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO test"
end

task :clean do
    sh "xctool -workspace ErnKit.xcworkspace -scheme ErnKit ONLY_ACTIVE_ARCH=NO clean"
end
