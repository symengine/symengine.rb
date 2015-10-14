require 'rbconfig'

ruby_executable = File.join(RbConfig::CONFIG['bindir'], RbConfig::CONFIG['RUBY_INSTALL_NAME'] + RbConfig::CONFIG['EXEEXT'])
exec 'cmake -DCMAKE_INSTALL_PREFIX=../../ -DRUBY_EXECUTABLE=%s %s ../../ ' % [ruby_executable, ARGV.join(" ")]

