PS_SHELL = bash

run-default: ## Run the service in the background
	@echo "Starting "$(PS)" in background"
	@make show-url
	docker-compose up -d

runf-default: ## Run the service in the foreground
	@echo "Starting "$(PS)" in foreground"
	@make show-url
	docker-compose up

stop-default: ## Stop the service
	@echo "Killing "$(PS)" container"
	docker-compose down

restart-default: stop print-newline run ## Restart the service

logs-default: ## Show latest logs
	docker-compose logs --follow --tail 50

logsa-default: ## Show all logs since the service's last start
	docker-compose logs --follow

tty-default: ## Start the primary service with a user shell
	docker-compose run "$(PS)" $(PS_SHELL)

ttyr-default: ## Start the primary service with a root shell
	docker-compose run -u root "$(PS)" $(PS_SHELL)

attach-default: ## Attach to the primary service with a user shell
	docker-compose exec "$(PS)" $(PS_SHELL)

attachr-default: ## Attach to the primary service with a root shell
	docker-compose exec -u root "$(PS)" $(PS_SHELL)

conf-default: ## Show the docker-compose config
	docker-compose config

show-url-default: ## Show the traefik URL of the service
	@{ \
		if ! [ -x "$$(command -v yq)" ];  \
		then \
			echo "WARNING: Please install yq to show service URL."; \
		else \
			export URL=$$( \
				docker-compose config | \
				yq eval '.services.$(PS).labels' - | \
				grep "traefik\..*\.rule:.*Host" | \
				gawk 'match($$0, ".*Host\\(`([^`]*)`\\)", m) { printf "https://%s/", m[1]}' \
			); \
			if ! [ -z "$$URL" ]; then \
				echo "Service URL: $$URL"; \
			fi \
		fi \
	}

print-newline-default:
	@echo ""
	@echo ""


# Default command override
# This makes it possible to call the `xxx-default` targets by just using `xxx`.
#
# At the same time it allows us to override targets without warnings in the
# main Makefile.
%:  %-default
	@  true
