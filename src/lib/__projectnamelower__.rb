require '!{projectnamelower}/version'

module !{project_name_camel}
  # Gets the root directory of this project
  # @param [String] dirs the directories to append to the return value
  # @return [String] the root directory
  # @example
  #   !{project_name_camel}.root("testing", "test2") #=> "/Users/user/app/testing/test2"
  def self.root(*dirs)
    File.join(File.expand_path('../..', __FILE__), dirs)
  end
end
