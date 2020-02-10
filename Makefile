pothon-makemigration-and-migrate:
	docker exec -i -u root pi bash -c "python3 manage.py makemigrations && python3 manage.py migrate"

test-environment:
	docker exec -i -u root pythoncici bash -c "which python3"

test-coverage:
	docker exec -i -u root pythoncici bash -c "python3 manage.py test && python3 -m pytest -s --cov=. --cov-report=html"

black-test:
	docker exec -i -u root pythoncici bash -c "black saleor"

security-issue:
	docker exec -i -u root pythoncici bash -c "bandit slaeor"

pyflakes-analyzes:
	docker exec -i -u root pythoncici bash -c "pyflakes saleor"

unittest-nosetest:
	docker exec -i -u root pythoncici bash -c "nosetests -v saleor"

static-code-analysis:
	docker exec -i -u root pythoncici bash -c "pylint saleor"
