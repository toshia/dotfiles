# -*- mode:ruby; coding: utf-8 -*-
# frozen_string_literal: true

CONFIG_FILES = YAML.load_file(CUR/'config_files.yml')

CONFIG_FILES.each do |dirname|
  desc "Generate ~/.config/#{dirname}/"
  file CONFIG/dirname do
    symlink SRC/dirname, CONFIG/dirname
  end
end

task config_files: CONFIG_FILES.map(&CONFIG.method(:/)).map(&:to_s)

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

task :remove_config_files do
  CONFIG_FILES.map(&CONFIG.method(:/)).select(&:symlink?).each(&method(:rm))
end
