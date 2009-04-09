module Kernel
  
  def windows_platform?
    RUBY_PLATFORM =~ /win32/
  end
  
  def linux_platform?
    RUBY_PLATFORM =~ /linux/
  end
  
  def mac_platform?
    RUBY_PLATFORM =~ /darwin/
  end
  alias :osx_platform? :mac_platform?
  
  def freebsd_platform?
    RUBY_PLATFORM =~ /freebsd/
  end
  
  def unix_platform?
    linux_platform? || mac_platform? || freebsd_platform?
  end
  
  def unknown_platform?
    RUBY_PLATFORM =~ /(win32|linux|darwin|freebsd)/
  end
  
end