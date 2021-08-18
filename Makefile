# Self-Documented Makefile: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

EXEC=hello
MPICC?=mpicc

.PHONY: build
build: ## Compile the MPI HelloWorld
	${MPICC} -o ${EXEC} hello.c

.PHONY: clean
clean: ## Remove binaries
	rm -f ${EXEC}

.PHONY: sub
sub: ## Submit job
	qsub pbs.sh

.PHONY: stat
stat: ## Check status for running and queued jobs
	qstat -sw

.PHONY: help
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
