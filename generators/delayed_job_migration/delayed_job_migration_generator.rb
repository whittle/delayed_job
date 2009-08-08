class DelayedJobMigrationGenerator < Rails::Generator::NamedBase
	def initialize(runtime_args, runtime_options = {})
		runtime_args << 'create_delayed_jobs' if runtime_args.empty?
		super
	end
	
	def manifest
		record do |m|
			m.migration_template 'migration.rb', 'db/migrate',
				:assigns => { :delayed_job_table_name => default_delayed_job_table_name }
		end
	end
	
	protected
	
	def default_delayed_job_table_name
		ActiveRecord::Base.pluralize_table_names ? 'delayed_job'.pluralize : 'delayed_job'
	end
end
