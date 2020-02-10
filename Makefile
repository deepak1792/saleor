build:
	docker build -t opstree/pythoncici

run:
	docker rm -f pythonci || true
	docker run -itd --name pythoncici -v ${PWD}:/root opstree/pythoncici

python-makemigration-and-migrate:
	docker exec -i pythoncici bash -c "python3 manage.py makemigrations && python3 manage.py migrate"

test-environment:
	docker exec -i pythoncici bash -c "which python3"

test-coverage:
	docker exec -i pythoncici bash -c "python3 manage.py test && python3 -m pytest -s --cov=. --cov-report=html"

black-test:
	docker exec -i pythoncici bash -c "black saleor"

security-issue:
	docker exec -i pythoncici bash -c "bandit slaeor"

pyflakes-analyzes:
	docker exec -i pythoncici bash -c "pyflakes saleor"

unittest-nosetest:
	docker exec -i pythoncici bash -c "nosetests -v saleor"

static-code-analysis:
	docker exec -i pythoncici bash -c "pylint saleor"
