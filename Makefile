up:
	docker compose up --build --remove-orphans -d ubuntu2004 && docker compose run --rm ubuntu2004 /bin/bash

down:
	docker compose rm -fsv ubuntu2004

clean:
	docker compose rm -fsv ubuntu2004 && docker rmi learn:ubuntu2004_develop
