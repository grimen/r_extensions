# TODO: Get options to work
module RExtensions
  def options
    @options ||= {}
    @options[:default_per_page] ||= 20
  end
end