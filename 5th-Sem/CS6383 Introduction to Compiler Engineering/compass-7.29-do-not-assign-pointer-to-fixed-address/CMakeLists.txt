# Created on Sat Sep 14 2019
# 
# Copyright (c) 2019 Shraiysh Vaishay

cmake_minimum_required(VERSION 3.10)

include(CheckCXXCompilerFlag)
include(CheckCCompilerFlag)
  
find_package(Clang CONFIG REQUIRED PATHS /usr/lib/llvm-8/lib/cmake NO_DEFAULT_PATH)
message(STATUS "${CLANG_CMAKE_DIR}")
message(STATUS "Clang found! ${CLANG_INSTALL_PREFIX}")

function(append_if condition value)
  if (${condition})
    foreach(variable ${ARGN})
      set(${variable} "${${variable}} ${value}" PARENT_SCOPE)
    endforeach(variable)
  endif()
endfunction()

macro(add_flag_if_supported flag name)
  check_c_compiler_flag("-Werror ${flag}" "C_SUPPORTS_${name}")
  append_if("C_SUPPORTS_${name}" "${flag}" CMAKE_C_FLAGS)
  check_cxx_compiler_flag("-Werror ${flag}" "CXX_SUPPORTS_${name}")
  append_if("CXX_SUPPORTS_${name}" "${flag}" CMAKE_CXX_FLAGS)
endmacro()

add_flag_if_supported("-Wall" WALL)
add_flag_if_supported("-Wimplicit-fallthrough" WIMPLICIT_FALLTHROUGH)
add_flag_if_supported("-Werror=date-time" WERROR_DATE_TIME)
add_flag_if_supported("-Werror=unguarded-availability-new" WERROR_UNGUARDED_AVAILABILITY_NEW)
add_flag_if_supported("-Wimplicit-fallthrough" IMPLICIT_FALLTHROUGH_FLAG)
add_flag_if_supported("-Wcovered-switch-default" COVERED_SWITCH_DEFAULT_FLAG)
add_flag_if_supported("-Wdelete-non-virtual-dtor" DELETE_NON_VIRTUAL_DTOR_FLAG)
add_flag_if_supported("-Wstring-conversion" STRING_CONVERSION_FLAG)



# The following libraries are not found in the installed packages
list(REMOVE_ITEM CLANG_EXPORTED_TARGETS
  modularize
  clang-format
  clang-import-test
  clang-rename
  clang-refactor
  clang-apply-replacements
  clang-reorder-fields
  clang-tidy
  clangd
  clang-include-fixer
  )


add_executable(visitor visitor.cpp)
target_include_directories(visitor PRIVATE ${CLANG_INCLUDE_DIRS} ${PROJECT_SOURCE_DIR})
target_link_libraries(visitor ${CLANG_EXPORTED_TARGETS})

add_executable(matcher matcher-Fixed-pointer.cpp)
target_include_directories(matcher PRIVATE ${CLANG_INCLUDE_DIRS} ${PROJECT_SOURCE_DIR})
target_link_libraries(matcher ${CLANG_EXPORTED_TARGETS})
