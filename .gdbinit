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
 
# STL pretty printers
python
import sys
sys.path.insert(0, '/home/dhecht/env/gdb/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

#handle SIGSEGV nostop noprint pass

# So functions can be called
define hook-stop
  handle SIGSEGV stop print pass
end
define hook-run
  handle SIGSEGV nostop noprint pass
end
define hook-continue
  handle SIGSEGV nostop noprint pass
end

#source /home/dhecht/env/gdb/python/lwp_to_id.py

