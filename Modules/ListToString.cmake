
function(list_to_string separator input_list output_string_var)
  set(_string "")
  cmake_policy(PUSH)
  cmake_policy(SET CMP0007 OLD)
  # Get list length
  list(LENGTH input_list list_length)
  # If the list has 0 or 1 element, there is no need to loop over.
  if(list_length LESS 2)
    set(_string  "${input_list}")
  else()
    math(EXPR last_element_index "${list_length} - 1")
    foreach(index RANGE ${last_element_index})
      # Get current item_value
      list(GET input_list ${index} item_value)
      # .. and append to output string
      set(_string  "${_string}${item_value}")
      # Append separator if current element is NOT the last one.
      if(NOT index EQUAL last_element_index)
        set(_string  "${_string}${separator}")
      endif()
    endforeach()
  endif()
  set(${output_string_var} ${_string} PARENT_SCOPE)
  cmake_policy(POP)
endfunction()

