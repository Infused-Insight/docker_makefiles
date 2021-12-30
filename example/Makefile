# Run `make help` to get full list of available commands.
# Many targets are in the included makefiles.

# Default make targets
# These are the built-in commands that should be made available.
# The order in which you put them, is the order in which they will appear
# in the help.
include ../docker.mk
include ../help.mk

# Primary Service configuration
# Some commands, such as `make attach` target a specific service.
# This defines, which service should be used by default.
# If you want to target another one, you can override it in the command
# with `make attach PS=traefik`
PS = whoami

# Set `help` as the default command
# Include this if you want running `make` to output the help instead of
# running `make build`
.DEFAULT_GOAL := help

# Additional make targets
# Add custom targets like this.
# By adding a comment, you make them appear in the help
attach-traefik: ## Attach to the traefik service with a user shell
	docker-compose exec "traefik" /bin/sh

# Override default targets
# You can replace default targets by simply reimplementing them in
# your Makefile.
# Leave out the comment to make sure it doesn't show up twice in the help.
log:
	@echo "3.6 roentgen, not great, not terrible..."