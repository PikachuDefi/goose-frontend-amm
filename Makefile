all: 

clean:
	rm -rf build node_modules cypress

deps:
	yarn

build: deps
	npm run build

deploy: deps build
	aws s3 sync ./build s3://pikachu-frontend-amm --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers --exclude '*.bat' --exclude '*.sh' --delete --profile pikachuFinance

test: deps
	yarn start

cypress: deps
	yarn cypress run
