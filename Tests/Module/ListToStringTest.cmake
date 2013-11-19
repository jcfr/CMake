#
# cmake -P ListToStringTest.cmake
#
function(list_to_string_test)

  function(list_to_string_test_check id current_output expected_output)
    if(NOT "${current_output}" STREQUAL "${expected_output}")
      message(FATAL_ERROR "Problem with list_to_string() - See testcase: ${id}\n"
                          "current_output:${current_output}\n"
                          "expected_output:${expected_output}")
    endif()
  endfunction()
  
  include(${CMAKE_ROOT}/Modules/ListToString.cmake)

  set(id 1)
  set(case${id}_input "")
  set(case${id}_expected_output "")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 2)
  set(case${id}_input item1)
  set(case${id}_expected_output "item1")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 3)
  set(case${id}_input item1 item2)
  set(case${id}_expected_output "item1^^item2")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 4)
  set(case${id}_input item1 item2 item3)
  set(case${id}_expected_output "item1^^item2^^item3")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 5)
  set(case${id}_input item1 item2 item3 item4)
  set(case${id}_expected_output "item1^^item2^^item3^^item4")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 6)
  set(case${id}_input item1 "" item3 item4)
  set(case${id}_expected_output "item1^^item3^^item4")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 7)
  set(case${id}_input item1 ^^item2 item3 item4)
  set(case${id}_expected_output "item1^^^^item2^^item3^^item4")
  list_to_string("^^" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 8)
  set(case${id}_input item1 item2 item3 item4)
  set(case${id}_expected_output "item1item2item3item4")
  list_to_string("" "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  set(id 9)
  set(case${id}_input item1 item2 item3 item4)
  set(case${id}_expected_output "item1 item2 item3 item4")
  list_to_string(" " "${case${id}_input}" case${id}_current_output)
  list_to_string_test_check(${id} "${case${id}_current_output}" "${case${id}_expected_output}")

  message("SUCCESS")
endfunction()

list_to_string_test()

