
build-default: ## Build the image
	docker build . \
		--tag "$(TAG_NAME)"

push-default: ## Push the image to the container registry
	docker push "$(TAG_NAME)"

# Default command override
# This makes it possible to call the `xxx-default` targets by just using `xxx`.
#
# At the same time it allows us to override targets without warnings in the
# main Makefile.
%:  %-default
	@  true
