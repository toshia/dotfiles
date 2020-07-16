#! /bin/fish

set github_status (jq -r '.status.indicator + "\n" + .status.description' /tmp/github-status.json)
switch $github_status[1]
    case 'none'
        echo '✅'
    case 'minor'
        echo '⚠' $github_status[2]
    case 'major'
        echo '🛑' $github_status[2]
    case 'critical'
        echo '😇' $github_status[2]
    case '*'
        echo $github_status[1] $github_status[2]
end
