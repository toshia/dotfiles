# -*- mode:ruby; coding: utf-8 -*-
# frozen_string_literal: true

require 'pathname'
require 'yaml'

CUR = Pathname(__dir__)
SRC = CUR/'src'
HOME = Pathname(Dir.home)
CONFIG = HOME/'.config'

CONFIG_FILES = YAML.load_file(CUR/'config_files.yml')
DOT_FILES = YAML.load_file(CUR/'dot_files.yml')

CONFIG_FILES.each do |dirname|
  desc "Generate ~/.config/#{dirname}/"
  file CONFIG/dirname do
    symlink SRC/dirname, CONFIG/dirname
  end
end

DOT_FILES.each do |filename|
  desc "Generate ~/.#{filename}"
  file HOME/".#{filename}" do
    symlink SRC/filename, HOME/".#{filename}"
  end
end

task :default => %i[config_files dot_files]

task config_files: CONFIG_FILES.map(&CONFIG.method(:/)).map(&:to_s)

task dot_files: DOT_FILES.map{|f| HOME./(".#{f}").to_s }

desc "add .config/"
task :config ,%i[name] do |task, args|
  name = args[:name]
  abort 'file exists.' if CONFIG_FILES.include?(name)
  src, dst = CONFIG/name, SRC/name
  mv src, dst
  symlink dst, src
  system "git add #{name}/"
  File.open(CUR/'config_files.yml', 'w') do |w|
    w << YAML.dump([*CONFIG_FILES, name].sort)
  end
  system "git add config_files.yml"
  system "git commit -m 'add #{name}'"
end

desc "add dotfile"
task :dot ,%i[name] do |task, args|
  name = args[:name]
  abort 'file exists.' if DOT_FILES.include?(name)
  src, dst = HOME/".#{name}", SRC/name
  mv src, dst
  symlink dst, src
  system "git add #{name}"
  File.open(CUR/'dot_files.yml', 'w') do |w|
    w << YAML.dump([*DOT_FILES, name].sort)
  end
  system "git add dot_files.yml"
  system "git commit -m 'add #{name}'"
end

desc "remove all symlink to dotfiles"
task :remove => %i[remove_config_files remove_dot_files]

task :remove_config_files do
  CONFIG_FILES.map(&CONFIG.method(:/)).select(&:symlink?).each(&method(:rm))
end

task :remove_dot_files do
  DOT_FILES.map{|f| HOME/".#{f}" }.select(&:symlink?).each(&method(:rm))
end
