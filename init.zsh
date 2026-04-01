# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::loom::deps()
#
#>
######################################################################
p6df::modules::loom::deps() {
  ModuleDeps=(p6m7g8-dotfiles/p6common)
}

######################################################################
#<
#
# Function: words loom $LOOM_API_KEY = p6df::modules::loom::profile::mod()
#
#  Returns:
#	words - loom $LOOM_API_KEY
#
#  Environment:	 LOOM_API_KEY
#>
######################################################################
p6df::modules::loom::profile::mod() {

  p6_return_words 'loom' '$LOOM_API_KEY'
}
