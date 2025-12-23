cmake_minimum_required(VERSION 3.16)
project(Long_numbers LANGUAGES CXX)


enable_testing()


add_library(long_number_lib "")


add_subdirectory(modern_programming/libs/googletest)


add_subdirectory(modern_programming/Long_numbers/src)
add_subdirectory(modern_programming/Long_numbers/test)
