# Executables: local only
DOCKER_COMP = docker compose
DOCKER_COMP_EXEC = $(DOCKER_COMP) exec mosquitto

# Misc
.DEFAULT_GOAL = help

help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

alias: ## Displays all alias of the package manager
	$(DOCKER_COMP_EXEC) npm run

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Builds the Node image
	$(DOCKER_COMP) build

up: ## Starts the docker hub
	$(DOCKER_COMP) up -d

down: ## Stops the docker hub
	$(DOCKER_COMP) down --remove-orphans

restart: ## Restarts the docker hub
	$(DOCKER_COMP) restart

sh: ## Connects to the application container
	$(DOCKER_COMP_EXEC) sh

logs: ## Displays the logs of the application container
	$(DOCKER_COMP) logs -f mosquitto

## —— Project 🐝 ———————————————————————————————————————————————————————————————
setup-project: ## Initializes configuration
	bin/setup
	make build
