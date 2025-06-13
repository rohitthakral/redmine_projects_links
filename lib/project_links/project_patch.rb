module ProjectLinks
  module ProjectPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        has_many :project_links
      end
    end
    module InstanceMethods
    end
  end
end

unless Project.included_modules.include?(ProjectLinks::ProjectPatch)
  Project.send(:include, ProjectLinks::ProjectPatch)
end