################################################################
# \file      .bash_logout
# \brief     Executed by bash(1) when login shell exits.
# \author    Doug Hague
# \date      04.05.2014
# \copyright GPLv3
################################################################

# when leaving the console clear the screen to increase privacy
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
