PROJECT_NAME = 'ErnKit'
WORKSPACE_NAME = PROJECT_NAME + '.xcworkspace'
SDK_VERSION = 'iphonesimulator6.1'
SCHEME_NAME = PROJECT_NAME
BUILD_FOLDER = 'Build'
OBJECT_FOLDER = BUILD_FOLDER + '/' + PROJECT_NAME + '.build/Objects-normal/i386'
COVERAGE_FILE = BUILD_FOLDER + '/coverage.info'
COVERAGE_FOLDER = BUILD_FOLDER + '/Coverage'
TEST_REPORT_FILE = BUILD_FOLDER + '/junit-report.xml'
XCTOOL_COMMAND = "xctool -workspace #{WORKSPACE_NAME} -scheme #{SCHEME_NAME} -sdk #{SDK_VERSION} -reporter junit:#{TEST_REPORT_FILE} -reporter pretty CONFIGURATION_TEMP_DIR='#{BUILD_FOLDER}' ONLY_ACTIVE_ARCH=NO"

task :default => [:clean, :test]

desc "Build"
task :build do
    sh "#{XCTOOL_COMMAND} build"
end

desc "Test"
task :test do
    sh "#{XCTOOL_COMMAND} test"
end

desc "Clean"
task :clean do
    sh "#{XCTOOL_COMMAND} clean"
    FileUtils.rm_rf(BUILD_FOLDER)
end

desc "Coverage"
task :coverage => [:test] do
    sh "lcov -c -d #{OBJECT_FOLDER} -o #{COVERAGE_FILE} --rc lcov_branch_coverage=1"
    sh "lcov --remove #{COVERAGE_FILE} \"/Applications*\" -o #{COVERAGE_FILE} --rc lcov_branch_coverage=1"
    sh "genhtml #{COVERAGE_FILE} -o #{COVERAGE_FOLDER} --rc lcov_branch_coverage=1"
end

STUBSERVER_TMP_FOLDER = 'tmp'
STUBSERVER_LOG = STUBSERVER_TMP_FOLDER + '/stubServer.log'
STUBSERVER_PORT = '3333'
STUBSERVER_FOLDER = 'DemoServer'
STUBSERVER_CONFIG = STUBSERVER_FOLDER + '/config.ru'

namespace :server do
    desc "Start server"
    task :start => :stop do
        puts 'Starting the demo server...'
        system("thin start -p #{STUBSERVER_PORT} -a 127.0.0.1 -l #{STUBSERVER_LOG} -R #{STUBSERVER_CONFIG} -d")
    end

    desc "Restart server"
    task :restart do
        exec('thin restart -R #{STUBSERVER_CONFIG} -d')
    end

    desc "Stop server"
    task :stop do
        begin
            puts 'Stopping the server...'
            verbose(false) do
                system('thin stop -q > /dev/null')
            end
        rescue
        end
    end
end
