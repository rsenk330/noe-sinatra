config_file = !{project_name_camel}.root("config", "mongoid.yml")

Mongoid.load!(config_file)
