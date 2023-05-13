#!/bin/bash

#######################################
# Transforms a key,value pair delimited input
# with quotes and commas
#
# Example:
# Input:
# Key1: Value1
# Key2: Value2
# Key3: Value3
#
# Output:
# 'Key1':' Value1',
# 'Key2':' Value2',
# 'Key3':' Value3',
#
# Usage:
# cat test.txt | token_to_json
#######################################
function token_to_json
{
    awk -F: '{ print "\x27"$1"\x27" "\x3a" "\x27"$2"\x27" "\x2c" }'
}

#######################################
# Quickly Reference Git Conventional Commits
#######################################
function git_conventions {
    cat << EOF
type(scope): description

feat:          addition of some new features
add:           changes to add new capability or functions
cut:           removing the capability or functions
fix:           a bug fix
bump:          increasing the versions or dependency versions
build:         changes to build system or external dependencies
make:          change to the build process, or tooling, or infra
ci:            changes to CI configuration files and scripts
doc:           changes to the documentation
test:          adding missing tests or correcting existing tests
chore:         changes for housekeeping (avoiding this will force more meaningful message)
refactor:      a code change that neither fixes a bug nor adds a feature
style:         changes to the code that do not affect the meaning
optimize/perf: a code change that improves performance
revert:        reverting an accidental commit

BREAKING CHANGE: a commit that has a footer BREAKING CHANGE:,
or appends a ! after the type/scope
EOF
}

#######################################
# Traverses to the Root Directory of a Git Repository.
# If a repository cannot be found then stop at the $HOME directory
#######################################
function githome
{
    CURRENT=$(pwd)
    while [[ "$CURRENT" != "$HOME" ]]
    do
        if [ -d .git ]; then
            break
        fi

        cd ..
        CURRENT=$(pwd)
    done
}

#######################################
# Runs a Speed Test and saves into a location
#######################################
function speed_test
{
    SAVE_LOC=$HOME/Dropbox/Data/Broadband/data.jsonl
    echo "Running Speed Test and saving in" $SAVE_LOC
    speedtest --json >> $SAVE_LOC
}

#######################################
# Check to see if the bucket name is available in AWS S3
# https://www.reddit.com/r/aws/comments/v940zq/command_to_check_aws_s3_bucket_name_availability/
# Usage: check_s3_bucket my_bucket
# If it returns something then the bucket exists
#######################################
function check_s3_bucket
{
    curl -sI https://$1.s3.amazonaws.com | grep bucket-region
}

#######################################
# Provides an interactive input of possible gitignore files
# Once choosen, adds to the current .gitignore file
#######################################
function gitignore
{
    curl -s "https://www.toptal.com/developers/gitignore/api/list?format=json" | jq -r 'keys[]' | fzf | xargs -I _ curl -sL https://www.toptal.com/developers/gitignore/api/_ >> .gitignore
    echo "Added!"
}

#######################################
# Sources the .env file in the current directory as environment variables
#######################################
function source_dotenv
{
    cat .env | awk 'NF > 0' | awk '{print "export " $0}' >> ._temp_env && source ._temp_env && rm ._temp_env
}

#######################################
# Sources a python virtual environment from the local directory
#######################################
function source_pyenv
{
    [ -f .venv/bin/activate ] && source .venv/bin/activate
    [ -f .env/bin/activate ] && source .env/bin/activate
}

#######################################
# Check GitHub API Rate Limits
#######################################
function github_rate_limit
{
    curl -sH "Authorization: token $GITHUB_TOKEN" -X GET https://api.github.com/rate_limit | bat --language json
}


#######################################
# Creates a quick tmux popup with a python interpreter.
#######################################
function python_popup
{
    if [ -x "$(command -v ptpython)" ]; then
        tmux display-popup -e PATH=$PATH -w 75% -h 75% ptpython
        return
    elif [ -x "$(command -v ipython)" ]; then
        tmux display-popup -e PATH=$PATH -w 75% -h 75% ipython
        return
    elif [ -x "$(command -v bpython)" ]; then
        tmux display-popup -e PATH=$PATH -w 75% -h 75% bpython
        return
    elif [ -x "$(command -v python3)" ]; then
        tmux display-popup -e PATH=$PATH -w 75% -h 75% python3
        return
    elif [ -x "$(command -v python)" ]; then
        tmux display-popup -e PATH=$PATH -w 75% -h 75% python
        return
    else
        tmux display-message "No suitable Python interpreter found."
    fi
}
