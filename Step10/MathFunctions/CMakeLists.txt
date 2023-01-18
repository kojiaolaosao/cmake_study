#1.添加运行库
add_library(MathFunctions MathFunctions.cxx)

#2.声明任何链接到我们的人都需要包含当前源目录 来找到MathFunction.h，当我们不需要
target_include_directories(MathFunctions INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})

#3.是否开启使用我们自己的math方法
option(USE_MYMATH "Use tutorial provided math implementation" ON)
if (USE_MYMATH)
  #4.定义宏
  target_compile_definitions(MathFunctions PRIVATE "USE_MYMATH")

  #5.首先我们添加生成表的可执行文件
  add_executable(MakeTable MakeTable.cxx)
  target_link_libraries(MakeTable PRIVATE tutorial_compiler_flags)

  #6.添加生成源代码命令
  add_custom_command(
          OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
          COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
          DEPENDS MakeTable
  )

  #7.只编译sqrt库
  add_library(SqrtLibrary STATIC
          mysqrt.cxx
          ${CMAKE_CURRENT_BINARY_DIR}/Table.h
          )



  #8.声明我们依赖的二进制目录查找Table.h
  target_include_directories(SqrtLibrary PRIVATE ${CMAKE_CURRENT_BINARY_DIR})

  #声明sqrt是需要PIC的当默认是动态库时候
  set_target_properties(SqrtLibrary PROPERTIES
          POSITION_INDEPENDENT_CODE ${BUILD_SHARED_LIBS})

  target_link_libraries(SqrtLibrary PUBLIC tutorial_compiler_flags)
  target_link_libraries(MathFunctions PRIVATE SqrtLibrary)
endif ()

target_link_libraries(MathFunctions PUBLIC tutorial_compiler_flags)

#9.定义表示我们正在使用标志宏当在win上时
target_compile_definitions(MathFunctions PRIVATE "EXPORTING_MYMATH")

#10.install libs
set(installable_libs MathFunctions tutorial_compiler_flags)
if (TARGET SqrtLibrary)
  list(APPEND installable_libs SqrtLibrary)
endif ()
install(TARGETS ${installable_libs} DESTINATION lib)

#11.install includes
install(FILES MathFunctions.h DESTINATION include)