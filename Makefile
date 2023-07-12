include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: init
init:

.PHONY: install
install:
	@./scripts/install

.PHONY: link
link:
	one link
