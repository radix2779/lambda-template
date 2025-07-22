install:
	@npm install

dev:
	@npm dev

test:
	@npm test

lint:
	@npm lint

build-image:
	docker build .
