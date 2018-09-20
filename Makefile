.DEFAULT_GOAL := help

# https://gist.github.com/tadashi-aikawa/da73d277a3c1ec6767ed48d1335900f3
.PHONY: $(shell grep -E '^[a-zA-Z_-]+:' $(MAKEFILE_LIST) | sed 's/://')


MD_PATH = "/path/to/markdown/dir"

lint: ## lint markdown
	$(eval DIR_NAME := $(shell echo $(shell cd ${MD_PATH} && pwd)))
	docker run --rm \
		-v $(DIR_NAME):/work \
		-w /work \
		tmknom/docker-markdownlint:1.0.0 \
		markdownlint .


# https://postd.cc/auto-documented-makefile/
help: ## show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'