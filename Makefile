include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: install
install:
	@./scripts/install
