test-deploy:
	act --container-architecture linux/amd64 -j test -W .github/workflows/test-deploy.yaml --secret-file my.secret