################################################################################
#                                                                              #
# soil: ROOT environment setup                                                 #
#                                                                              #
################################################################################
#                                                                              #
# INSTRUCTIONS                                                                 #
#                                                                              #
# This program sets up ROOT and PyROOT environment variables. It should be at  #
# the same directory as the directory "root" and sourced.                      #
#                                                                              #
# This program has been tested with the following ROOT versions:               #
#                                                                              #
# - 5.34.18                                                                    #
# - 6.00.00                                                                    #
# - 6.01.02                                                                    #
# - 6.03.01                                                                    #
# - 6.07.07                                                                    #
# - 6.08.00                                                                    #
# - 6.08.02                                                                    #
#                                                                              #
################################################################################
#                                                                              #
# LICENCE INFORMATION                                                          #
#                                                                              #
# copyright (C) 2014 William Breaden Madden                                    #
#                                                                              #
# This software is released under the terms of the GNU General Public License  #
# version 3 (GPLv3).                                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU General Public License as published by the Free   #
# Software Foundation, either version 3 of the License, or (at your option)    #
# any later version.                                                           #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     #
# more details.                                                                #
#                                                                              #
# For a copy of the GNU General Public License, see                            #
# <http://www.gnu.org/licenses/>.                                              #
#                                                                              #
################################################################################

program_name="soil"
program_version="2017-03-01T1342Z"

# Determine the directory of this script.
# Specifically, resolve ${source} until the file is no longer a symlink. If
# ${source} is a relative symlink, there is a need to resolve it relative to the
# path of the symlink file.
source="${BASH_SOURCE[0]}"
while [ -h "${source}" ]; do
  directory="$(cd -P "$(dirname "${source}")" && pwd)"
  source="$(readlink "${source}")"
  [[ ${source} != /* ]] && source="${directory}/${source}"
done
directory="$(cd -P "$(dirname "${source}")" && pwd)"

# Set ROOT environment variables.
export ROOTSYS="${directory}"/root
export PATH="${ROOTSYS}"/bin:"${PATH}"
export LD_LIBRARY_PATH="${ROOTSYS}"/lib:"${LD_LIBRARY_PATH}"

# Check the ROOT version.
ROOT_version="$(root-config --version)"
ROOT_version_major="$(echo "${ROOT_version}" | cut -d. -f1)"

# Set PyROOT environment variables.
if [[ \
    "${ROOT_version_major}" = "6" || \
    "${ROOT_version_major}" = "5" \
    ]]; then
    export PYTHONPATH="${ROOTSYS}"/lib/
    export LD_LIBRARY_PATH=/usr/lib/python2.6/:"${LD_LIBRARY_PATH}"
fi

echo -e "You've soiled yourself: ROOT "${ROOT_version}" set up using "${program_name}" "${program_version}""
