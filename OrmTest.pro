# QxOrm 的通用配置，包含了 Qt 和 boost 库依赖
include($$PWD/lib/QxOrm/QxOrm.pro)

QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# 预编译头文件
!contains(DEFINES, _QX_NO_PRECOMPILED_HEADER) {
    PRECOMPILED_HEADER = precompiled.h
}

SUBDIRS += lib/

# QxOrm 库相关配置
INCLUDEPATH += $$PWD/lib/QxOrm/include
LIBS += -L$$PWD/lib/QxOrm/lib

# 设置生成的目标名称、添加依赖库
CONFIG(debug, debug|release) {
    TARGET = Userd
    LIBS += -lQxOrmd
} else {
    TARGET = User
    LIBS += -lQxOrm
}


# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
HEADERS += \
    export.h \
    precompiled.h \
    user.h

SOURCES += \
        main.cpp \
        user.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


