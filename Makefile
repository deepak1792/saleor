build:
	docker build -t opstree/pythonci .

run:
	docker rm -f pythonci || true
	docker run -itd --name pythonci -v ${PWD}:/root opstree/pythonci

python-makemigration-and-migrate:
	docker exec -i pythonci bash -c "python3 manage.py makemigrations && python3 manage.py migrate"

test-environment:
	docker exec -i pythonci bash -c "which python3"

test-coverage:
	docker exec -i pythonci bash -c "python3 manage.py test && python3 -m pytest -s --cov=. --cov-report=html"

black-test:
	docker exec -i pythonci bash -c "black saleor"

security-issue:
	docker exec -i pythonci bash -c "bandit slaeor"

pyflakes-analyzes:
	docker exec -i pythonci bash -c "pyflakes saleor"

unittest-nosetest:
	docker exec -i pythonci bash -c "nosetests -v saleor"

static-code-analysis:
	docker exec -i pythonci bash -c "pylint saleor"
