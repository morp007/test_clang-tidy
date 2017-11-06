cmake_minimum_required(VERSION 3.8)
project (testFUCKINGclangtidy CXX)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}")
set(SRC     "./sources")
set(HEADERS "./headers")

find_program(
    CLANG_TIDY_EXE
    NAMES "clang-tidy"
    DOC "Path to clang-tidy executable"
)
if(NOT CLANG_TIDY_EXE)
    message(STATUS "clang-tidy not found.")
else()
    message(STATUS "clang-tidy found: ${CLANG_TIDY_EXE}")

    # флаги из CLion
    set(CLANG_CHECKS "*,-cert-env33-c,-cppcoreguidelines-no-malloc,-cppcoreguidelines-pro-bounds-array-to-pointer-decay,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-pro-type-const-cast,-cppcoreguidelines-pro-type-cstyle-cast,-cppcoreguidelines-pro-type-union-access,-google-*,google-default-arguments,google-explicit-constructor,google-runtime-member-string-references,google-runtime-memset,google-runtime-operator,-llvm-*,-readability-simplify-boolean-expr,-readability-braces-around-statements,-readability-identifier-naming,-readability-function-size,-misc-bool-pointer-implicit-conversion,-misc-unused-parameters,-modernize-use-using,-safety-no-assembler,-clang-diagnostic-*,-clang-analyzer-*")

    set(DO_CLANG_TIDY "${CLANG_TIDY_EXE}" ${CLANG_CHECKS})
endif()

include_directories(${ROOT}/${HEADERS})

add_executable(main ${SRC}/main.cpp)

set_target_properties(
  main PROPERTIES
  CXX_STANDARD 14
  CXX_STANDARD_REQUIRED ON
  COMPILE_FLAGS "${WARNING_FLAGS}"
)

if(CLANG_TIDY_EXE)
    set_target_properties(
        main PROPERTIES
        CXX_CLANG_TIDY "${DO_CLANG_TIDY}"
    )
endif()
