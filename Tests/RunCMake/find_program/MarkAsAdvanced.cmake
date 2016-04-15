
# Convenience function
function(_dump_cache_entry_properties entryname)
  if(NOT verbose)
    return()
  endif()
  message(STATUS "---")
  foreach(property IN ITEMS
      ADVANCED
      HELPSTRING
      MODIFIED
      STRINGS
      TYPE
      VALUE
    )
    get_property(_value CACHE ${entryname} PROPERTY ${property} SET)
    message(STATUS "${entryname}_${property}_SET='${_value}'")
    get_property(_value CACHE ${entryname} PROPERTY ${property} DEFINED)
    message(STATUS "${entryname}_${property}_DEFINED='${_value}'")
    get_property(_value CACHE ${entryname} PROPERTY ${property})
    message(STATUS "${entryname}_${property}='${_value}'")
  endforeach()
endfunction()

# Input
set(_hint ${CMAKE_CURRENT_SOURCE_DIR}/A)
set(PROG ${_hint}/testA)
set(verbose 0)

# First call
find_program(PROG
  NAMES testA
  HINTS ${_hint}
  )

_dump_cache_entry_properties(PROG)

mark_as_advanced(PROG)
message(STATUS "PROG1='${PROG}'")

_dump_cache_entry_properties(PROG)

# Second call
set(PROG ${_hint}/testA)

find_program(PROG
  NAMES testA
  HINTS ${_hint}
  )
message(STATUS "PROG2='${PROG}'")

_dump_cache_entry_properties(PROG)
