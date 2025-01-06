function ruby
    if test -f Gemfile
        command bundle exec ruby $argv
    else
        command ruby $argv
    end
end
