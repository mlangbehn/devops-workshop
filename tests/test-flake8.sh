# Copyright [2018] IBM Corp. All Rights Reserved.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

#!/bin/bash -e

# shellcheck disable=SC1090
source "$(dirname "$0")"/../scripts/resources.sh

num_proc=$(grep processor /proc/cpuinfo | tail -1 | cut -d ' ' -f2)
((num_proc++))

#shellcheck disable=SC2046,SC2086
if flake8 --jobs="$num_proc" --show-source --statistics $(dirname $0)/../.; then
    test_passed "$0"
else
    test_failed "$0"
fi

