#!/bin/sh

# This script outputs a help for all commented targets in the included 
# makefiles.
#
# It is used within `help.mk`.

print_helpx() {
    echo "$1" | gawk '
        match($0, "(.*):(.*):.*## (.*)", m) {
            gsub("-default", "", m[2]);
            printf "  \033[36m%-30s\033[0m %s\n", m[2], m[3]
        }
    ' ;
};

if ! [ -x "$(command -v gawk)" ]; then
    echo "Please install gawk to display help."
    exit 1;
fi

MAKEFILE_LIST=$1;

# Get all targets with comments from all makefiles
MK_TARGETS_ALL=$(grep -E '^[a-zA-Z_-]+:.*?## .*$$' $MAKEFILE_LIST )

# Split included targets and Makefile targets
MK_TARGETS_DEFAULT=$(echo "$MK_TARGETS_ALL" | grep -v "^Makefile:");
MK_TARGETS_OTHER=$(echo "$MK_TARGETS_ALL" | grep "^Makefile:");

# Process target lines to generate help output
DEFAULT_HELP=$(print_helpx "$MK_TARGETS_DEFAULT");
OTHER_HELP=$(print_helpx "$MK_TARGETS_OTHER");

# Print the default commands from the included Makefiles
if ! [ -z "$DEFAULT_HELP" ]; then
    echo "Default commands:";
    echo "$DEFAULT_HELP";
fi

# Print the commands in the actual main Makefile
if ! [ -z "$OTHER_HELP" ]; then
    echo "\nAdditional service commands:"
    echo "$OTHER_HELP";
fi
