# Run `make help` to get full list of available commands.
# Many targets are in the included makefiles.

# Default make targets (Required)
# These are the built-in commands that should be made available.
# The order in which you put them, is the order in which they will appear
# in the help.
include ../docker.mk
include ../help.mk

# Primary Service configuration (Required)
# Some commands, such as `make attach` target a specific service.
# This defines, which service should be used by default.
# If you want to target another one, you can override it in the command
# with `make attach PS=traefik`
PS = whoami

# Primary Service Shell (Optional)
# By default `make attach` and `make tty` run bash in the containers.
# But since some docker images don't have bash installed, you can use this
# to change it.
PS_SHELL = /bin/sh

# Set another command as the default target (Optional)
# If you simply run `make` without specifying a target, it will show the help.
# If you'd rather it did something else, such as build, you can change it with
# the line below.
# .DEFAULT_GOAL := build

# Additional make targets (Optional)
# Add custom targets like this.
# By adding a comment, you make them appear in the help
attach-traefik: ## Attach to the traefik service with a user shell
	docker-compose exec "traefik" /bin/sh

# Override default targets (Optional)
# You can replace default targets by simply reimplementing them in
# your Makefile.
# Leave out the comment to make sure it doesn't show up twice in the help.
log:
	@echo "3.6 roentgen, not great, not terrible..."
