PROJECT = lager

ERLC_OPTS = +debug_info +warn_export_all +warn_export_vars +warn_shadow_vars +warn_obsolete_guard +'{parse_transform, lager_transform}'

PLT_APPS = hipe sasl mnesia crypto compiler syntax_tools
DIALYZER_OPTS = -Werror_handling -Wrace_conditions -Wunmatched_returns | fgrep -v -f ./dialyzer.ignore-warnings
# -Wunderspecs

DEPS_DIR = deps
DEPS = goldrush

CT_SUITES ?=

dep_goldrush = https://github.com/paulperegud/goldrush.git master

.PHONY: rel stagedevrel deps test

##
## Doc targets
##

APPS = kernel stdlib sasl erts ssl tools os_mon runtime_tools crypto inets \
	xmerl webtool snmp public_key mnesia eunit
