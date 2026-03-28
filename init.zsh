# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::loom::deps()
#
#>
######################################################################
p6df::modules::loom::deps() {
  ModuleDeps=()
}

######################################################################
#<
#
# Function: str str = p6df::modules::loom::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 LOOM_API_KEY P6_DFZ_PROFILE_LOOM
#>
######################################################################
p6df::modules::loom::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_LOOM"
  local api_key="$LOOM_API_KEY"

  if p6_string_blank_NOT "$profile"; then
    str="loom:\t\t  ${profile}:"
    if p6_string_blank_NOT "$api_key"; then
      str=$(p6_string_append "$str" "api" " ")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::loom::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export LOOM_API_KEY=...)
#
#  Environment:	 LOOM_API_KEY P6_DFZ_PROFILE_LOOM
#>
######################################################################
p6df::modules::loom::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_LOOM" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::loom::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 LOOM_API_KEY P6_DFZ_PROFILE_LOOM
#>
######################################################################
p6df::modules::loom::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_LOOM

  p6_return_void
}
