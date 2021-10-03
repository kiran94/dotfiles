#!/bin/bash

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
function token_to_json
{
    awk -F: '{ print "\x27"$1"\x27" "\x3a" "\x27"$2"\x27" "\x2c" }'
}

# Quickly Reference Git Conventional Commits
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

# Traverses to the Root Directory of a Git Repository.
# If a repository cannot be found then stop at the $HOME directory
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
