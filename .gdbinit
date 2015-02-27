echo Loading gdbinit\n
 
# Used to get full backtrace of all threads
define bt-thread
  thread apply all bt full
end
 
# These help improve GDB output, but make the output take up more screen spaace.
set print pretty on
set print array on
 
# By default this will log to 'gdb.log'
set logging on
#set logging file your-gdb-logfile.log
 
handle SIGSEGV nostop noprint pass

# STL pretty printers
python
import sys
sys.path.insert(0, '/home/dhecht/env/gdb/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end
