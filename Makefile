build:
	sudo docker build -t opstree/pythonci .

run:
	sudo docker rm -f pythonci || true
	sudo docker run -itd --name pythonci -v ${PWD}:/root opstree/pythonci

python-makemigration-and-migrate:
	sudo docker exec -i pythonci bash -c "python3 manage.py makemigrations && python3 manage.py migrate"

test-environment:
	sudo docker exec -i pythonci bash -c "which python3"

test-coverage:
	sudo docker exec -i pythonci bash -c "python3 manage.py test && python3 -m pytest -s --cov=. --cov-report=html"

black-test:
	sudo docker exec -i pythonci bash -c "black saleor"

security-issue:
	sudo docker exec -i pythonci bash -c "bandit slaeor"

pyflakes-analyzes:
	sudo docker exec -i pythonci bash -c "pyflakes saleor"

unittest-nosetest:
	sudo docker exec -i pythonci bash -c "nosetests -v saleor"

static-code-analysis:
	sudo docker exec -i pythonci bash -c "pylint saleor"
