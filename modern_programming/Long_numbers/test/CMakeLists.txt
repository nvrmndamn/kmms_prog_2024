add_executable(test_long_number
    tests.cpp
    test_operators.cpp
)

target_link_libraries(test_long_number
    long_number_lib
    gtest_main
)

add_test(NAME LongNumberTests COMMAND test_long_number)