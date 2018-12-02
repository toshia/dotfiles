# -*- mode:ruby; coding: utf-8 -*-
# frozen_string_literal: true

require 'pathname'
require 'yaml'

CUR = Pathname(__dir__)
HOME = Pathname(Dir.home)
CONFIG = HOME/'.config'

CONFIG_FILES = YAML.load_file(CUR/'config_files.yml')
DOT_FILES = YAML.load_file(CUR/'dot_files.yml')

CONFIG_FILES.each do |dirname|
  desc "Generate ~/.config/#{dirname}/"
  file CONFIG/dirname do
    symlink CUR/dirname, CONFIG/dirname
  end
end

DOT_FILES.each do |filename|
  desc "Generate ~/.#{filename}"
  file HOME/".#{filename}" do
    symlink CUR/filename, HOME/".#{filename}"
  end
end

task :default => CONFIG_FILES.map(&CONFIG.method(:/)).map(&:to_s)

desc "add .config/"
task :config ,%i[name] do |task, args|
  name = args[:name]
  abort 'file exists.' if CONFIG_FILES.include?(name)
  src, dst = CONFIG/name, CUR/name
  mv src, dst
  symlink dst, src
  system "git add #{name}/"
  File.open(CUR/'config_files.yml', 'w') do |w|
    pp [*CONFIG_FILES, name]
    w << YAML.dump([*CONFIG_FILES, name].sort)
  end
  system "git add config_files.yml"
  system "git commit -m 'add #{name}'"
end

desc "add dotfile"
task :dot ,%i[name] do |task, args|
  name = args[:name]
  abort 'file exists.' if DOT_FILES.include?(name)
  src, dst = HOME/".#{name}", CUR/name
  mv src, dst
  symlink dst, src
  system "git add #{name}"
  File.open(CUR/'dot_files.yml', 'w') do |w|
    pp [*DOT_FILES, name]
    w << YAML.dump([*DOT_FILES, name].sort)
  end
  system "git add dot_files.yml"
  system "git commit -m 'add #{name}'"
end
