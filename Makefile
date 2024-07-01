
up:
	cd opentelemetry && docker compose up -d --remove-orphans
	make run

down:
	cd opentelemetry && docker compose down -v

logs:
	cd opentelemetry && docker compose logs -f

status:
	cd opentelemetry && docker compose ps

run:
	cd app && flutter run -d macos

default: up
