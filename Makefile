
up:
	cd opentelemetry && docker compose -f compose.yml up -d --remove-orphans
	make run

down:
	cd opentelemetry && docker compose -f compose.yml down -v

logs:
	cd opentelemetry && docker compose -f compose.yml logs -f

status:
	cd opentelemetry && docker compose ps

ps: status

run:
	cd app && flutter run -d macos

restart: down
	make up

default: restart
