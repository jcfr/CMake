if(WIN32)
  set(_check_files
    [[lib]]
    [[lib/(lib)?namelink-none\.dll]]
    [[lib/(lib)?namelink-same\.dll]]
    [[lib/(lib)?namelink-sep\.dll]]
    [[lib/(lib)?namelink-skip\.dll]]
  )
elseif(CYGWIN)
  set(_check_files
    [[lib]]
    [[lib/cygnamelink-none\.dll]]
    [[lib/cygnamelink-same-1\.dll]]
    [[lib/cygnamelink-sep-1\.dll]]
    [[lib/cygnamelink-skip-1\.dll]]
  )
elseif(APPLE)
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.dylib]]
    [[lib/libnamelink-same\.1\.0\.dylib]]
    [[lib/libnamelink-same\.1\.dylib]]
    [[lib/libnamelink-same\.dylib]]
    [[lib/libnamelink-sep\.1\.0\.dylib]]
    [[lib/libnamelink-sep\.1\.dylib]]
    [[lib/libnamelink-skip\.1\.0\.dylib]]
    [[lib/libnamelink-skip\.1\.dylib]]
  )
elseif(NO_NAMELINK)
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.so]]
    [[lib/libnamelink-same\.so]]
    [[lib/libnamelink-sep\.so]]
    [[lib/libnamelink-skip\.so]]
  )
else()
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.so]]
    [[lib/libnamelink-same\.so]]
    [[lib/libnamelink-same\.so\.1]]
    [[lib/libnamelink-same\.so\.1\.0]]
    [[lib/libnamelink-sep\.so\.1]]
    [[lib/libnamelink-sep\.so\.1\.0]]
    [[lib/libnamelink-skip\.so\.1]]
    [[lib/libnamelink-skip\.so\.1\.0]]
  )
endif()
check_installed("^${_check_files}$")