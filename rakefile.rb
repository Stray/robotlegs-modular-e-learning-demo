require 'sprout'
# Optionally load gems from a server other than rubyforge:
# set_sources 'http://gems.projectsprouts.org'
sprout 'as3'

############################################
# Configure your Project Model
project_model :model do |m|
  m.project_name            = 'modularlessonplayer'
  m.language                = 'as3'
  m.background_color        = '#CCCCCC'
  m.width                   = 970
  m.height                  = 550
  m.keep_as3_metadata       = 'Inject'    
  # m.use_fdb               = true
  # m.use_fcsh              = true
  # m.preprocessor          = 'cpp -D__DEBUG=false -P - - | tail -c +3'
  # m.preprocessed_path     = '.preprocessed'
  # m.src_dir               = 'src'
  # m.lib_dir               = 'lib'
  # m.swc_dir               = 'lib'
  # m.bin_dir               = 'bin'
  # m.test_dir              = 'test'
  # m.doc_dir               = 'doc'
  # m.asset_dir             = 'assets'
  m.compiler_gem_name     = 'sprout-flex4sdk-tool'
  m.compiler_gem_version  = '>= 4.0.0'
  m.source_path           << "#{m.lib_dir}/robotlegs"
  # m.libraries             << :corelib
end

desc 'Compile and debug the application'
debug :debug

# set up the default rake task
task :default => :debug
