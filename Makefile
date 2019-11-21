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
