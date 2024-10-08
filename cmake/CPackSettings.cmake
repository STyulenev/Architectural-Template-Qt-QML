# Set standard installation directories
set(BINARY_DESTINATION ${CMAKE_INSTALL_BINDIR})
set(LIBRARY_DESTINATION ${CMAKE_INSTALL_LIBDIR})
set(ARCHIVE_DESTINATION ${CMAKE_INSTALL_LIBDIR})
set(INCLUDES_DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
set(INCLUDES_INSTALL_DIR ${INCLUDES_DESTINATION}/cpack-example)
set(DOC_DESTINATION "${CMAKE_INSTALL_DATAROOTDIR}/doc/cpack-example")

# Set permissions
set(BINARY_PERMISSIONS_DEFAULT
    OWNER_WRITE OWNER_READ OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE #755
)

set(LIB_PERMISSIONS_DEFAULT
    OWNER_WRITE OWNER_READ
    GROUP_READ WORLD_READ
)

set(DOC_PERMISSIONS_DEFAULT
    OWNER_WRITE OWNER_READ
    GROUP_READ WORLD_READ
)

set(INCLUDE_PERMISSIONS_DEFAULT
    OWNER_WRITE OWNER_READ
    GROUP_READ WORLD_READ
)
