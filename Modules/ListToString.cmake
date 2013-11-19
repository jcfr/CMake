
function(list_to_string separator input_list output_string_var)
  cmake_policy(PUSH)
  cmake_policy(SET CMP0007 OLD)
  set(_input_list "${input_list}")
  list(TO_STRING _input_list "${separator}" ${output_string_var})
  set(${output_string_var} ${${output_string_var}} PARENT_SCOPE)
  cmake_policy(POP)
endfunction()
