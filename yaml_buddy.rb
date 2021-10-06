# frozen_string_literal: true

require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with yaml data into @data
  # parameter: yaml - a String in TSV format
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
  end

  # to_yaml: converts @data into to_yaml string
  # returns: String in Yaml format
  def to_yaml
    @data.to_yaml
  end
end
