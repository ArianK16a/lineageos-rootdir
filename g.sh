#!/bin/bash
. build/envsetup.sh
export CCACHE_EXEC=$(command -v ccache)
export CCACHE_DIR=$(pwd)/.ccache
export USE_CCACHE=1
ccache -M 100G

. ../scripts/deps_helper.sh
. ../scripts/packagename.sh
. ../scripts/pick_helper.sh
. ../scripts/scan_helper.sh

. tools/buildscript/build.sh

#alias brunch='systemd-inhibit --who="lineage compilation" --why="Avoid interruptions during android compilation" --what=sleep --mode=delay brunch'
alias extract_target='./extract-files.py --keep-dump --only-target'
alias extract_common='./extract-files.py --keep-dump --only-common'
alias code='codium'
alias magicrebase='git -c rebase.instructionFormat="%s%nexec GIT_COMMITTER_DATE=\"%cD\" git commit --amend --no-edit" rebase -i'
alias clogcat='adb logcat -v color'

#export AVB_RSA4096_KEY_PATH=external/avb/test/data/testkey_rsa4096.pem
#export AVB_RSA2048_KEY_PATH=external/avb/test/data/testkey_rsa2048.pem
export AVB_RSA4096_KEY_PATH=.release-keys/avbkey_rsa4096.pem
export AVB_RSA2048_KEY_PATH=.release-keys/avbkey_rsa2048.pem
