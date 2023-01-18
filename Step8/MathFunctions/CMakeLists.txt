# does this system provide the log and exp functions?

#1.添加可执行文件
add_executable(MakeTable MakeTable.cxx)

#2.添加自定义命令，指定如何运行MakeTable生成Table.h
add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        DEPENDS MakeTable
)

#3.让cmake知道mysqrt.cxx依赖于Table.h , 通过将generated添加Table.h到库MathFunctions的源列表来完成的
add_library(MathFunctions
        mysqrt.cxx
        ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        )

# state that anybody linking to us needs to include the current source dir
# to find MathFunctions.h, while we don't.
#4.还需要将当前二进制目录添加到包含目录列表中
target_include_directories(MathFunctions
        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
        PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
        )

# link our compiler flags interface library
target_link_libraries(MathFunctions tutorial_compiler_flags)


# install libs
set(installable_libs MathFunctions tutorial_compiler_flags)
install(TARGETS ${installable_libs} DESTINATION lib)
# install include headers
install(FILES MathFunctions.h DESTINATION include)
