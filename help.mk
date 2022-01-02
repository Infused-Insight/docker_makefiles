.DEFAULT_GOAL := help

# Get path to this help.mk file
# Get path to the help script based on that (../scripts/make_help.sh)
# Run the script with a list of all makefiles
help-default: ## Show this help
	@{ \
		MK_PATH=$$(echo "$(MAKEFILE_LIST)" | tr " " "\n" | grep "help.mk$$"); \
		\
		MK_DIR=$$(dirname $$MK_PATH); \
		SCRIPT_PATH=$$(echo "$$MK_DIR/make_help.sh"); \
		\
		sh "$$SCRIPT_PATH" "$(MAKEFILE_LIST)"; \
	}

# Default command override
# This makes it possible to call the `xxx-default` targets by just using `xxx`.
#
# At the same time it allows us to override targets without warnings in the
# main Makefile.
%:  %-default
	@  true
