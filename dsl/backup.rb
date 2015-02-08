require 'singleton'

class Backup
  include Singleton

  attr_accessor :backup_directory, :interval
  attr_reader :data_sources

  def initialize
    @data_sources= []
    @backup_directory = '/backup'
    @interval = 60
  end

  def backup_files
    this_backup_dir = Time.now.ctime.tr(' :', '_')
    this_backup_path = File.join(backup_directory, this_backup_dir)
    @data_souces.each { |source| source.backup(this_backup_path) }
  end

  def run
    while true
      backup_files
      sleep(@interval * 60)
    end
  end
end
