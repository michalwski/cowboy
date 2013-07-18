# See LICENSE for licensing information.

PROJECT = cowboy

# Options.

COMPILE_FIRST = cowboy_middleware cowboy_sub_protocol
CT_SUITES = eunit http spdy ws
PLT_APPS = crypto public_key ssl

# Dependencies.

DEPS = ranch
TEST_DEPS = ct_helper
dep_ranch = https://github.com/michalwski/ranch.git fcef2af8a0c2b2e2b3fde339f01204aa8049316a
dep_ct_helper = https://github.com/extend/ct_helper.git master

# Standard targets.

include erlang.mk

# Extra targets.

.PHONY: autobahn

autobahn: clean clean-deps deps app build-tests
	@mkdir -p logs/
	@$(CT_RUN) -suite autobahn_SUITE
