install-dev:
	pipenv sync --dev

install:
	pipenv sync

lint:
	pipenv run pycodestyle --ignore=E126,E127,E128,W503 jarr/ --exclude=jarr/migrations

bootstrap-db:
	psql -c 'CREATE DATABASE jarr_test;' -U postgres
	echo '{"jarr_testing":true,"log":{"level":10},"db":{"pg_uri":"postgresql:///jarr_test"}}' > ~/.config/jarr.test.json

test:
	CONFIG_FILE=~/.config/jarr.test.json pipenv run nosetests tests/ -v --with-coverage --cover-package=jarr

init-db:
	docker-compose --file docker-compose-prepare.yml up python-base
	docker-compose up -d postgresql server
	$(shell sleep 10s)
	docker-compose exec postgresql su postgres -c "createuser jarr --no-superuser --createdb --no-createrole"
	docker-compose exec postgresql su postgres -c "createdb jarr --no-password"
	docker-compose exec server pipenv run ./manager.py db_create
	docker-compose exec server pipenv run ./manager.py db heads ce7bfcdd21fc
	docker-compose down
