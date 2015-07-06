
require 'logger'

module CloudSeed

  DEFAULT_OPTIONS = {
    template_path: ENV['CLOUDSEED_PATH'] || '',
    stack_prefix: ENV['CLOUDSEED_PREFIX']
  }

  def self.configure(options = {})
    @options = self.options.merge(options)
  end

  def self.options
    @options ||= DEFAULT_OPTIONS
  end

  # rubocop:disable Style/ClassVars
  def self.logger
    @@logger ||= Logger.new(STDOUT).tap do |log|
      log.level = Logger::INFO
      log.progname = 'CloudSeed'
    end
  end

  def self.logger=(logger)
    @@logger = logger.tap do |log|
      log.progname = 'CloudSeed'
    end
  end
  # rubocop:ensable Style/ClassVars

  def logger
    CloudSeed.logger
  end

end

Dir.glob(File.join(File.dirname(__FILE__), 'cloudseed', '**/*.rb')).each { |file| require file }