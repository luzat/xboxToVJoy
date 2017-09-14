#-------------------------------------------------
#
# Project created by QtCreator 2014-08-08T13:14:25
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = xboxToVJoy
TEMPLATE = app

INCLUDEPATH += $$PWD/vJoySDK/inc

isEmpty(TARGET_EXT) {
    win32 {
        TARGET_CUSTOM_EXT = .exe
    }
    macx {
        TARGET_CUSTOM_EXT = .app
    }
} else {
    TARGET_CUSTOM_EXT = $${TARGET_EXT}
}

win32 {
    DEPLOY_COMMAND = windeployqt
}
macx {
    DEPLOY_COMMAND = macdeployqt
}

CONFIG( debug, debug|release ) {
    # debug
    DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/debug/$${TARGET}$${TARGET_CUSTOM_EXT}))
} else {
    # release
    DEPLOY_TARGET = $$shell_quote($$shell_path($${OUT_PWD}/release/$${TARGET}$${TARGET_CUSTOM_EXT}))
}

#  # Uncomment the following line to help debug the deploy command when running qmake
#  warning($${DEPLOY_COMMAND} $${DEPLOY_TARGET})

# Use += instead of = if you use multiple QMAKE_POST_LINKs
QMAKE_POST_LINK = $${DEPLOY_COMMAND} $${DEPLOY_TARGET}

contains(QMAKE_HOST.arch, x86_64) {
    LIBS += -L$$PWD/vJoySDK/lib/amd64
} else {
    LIBS += -L$$PWD/vJoySDK/lib
}

LIBS += -lvJoyInterface dinput8.lib dxguid.lib comctl32.lib Xinput.lib

SOURCES += main.cpp \
    qmainwidget.cpp \
    controllerremapper.cpp \
    controllerwindow.cpp \
    dinputcorrelation.cpp \
    QtSingleApplication/qtlocalpeer.cpp \
    QtSingleApplication/qtlockedfile_unix.cpp \
    QtSingleApplication/qtlockedfile.cpp \
    QtSingleApplication/qtsingleapplication.cpp \
    QtSingleApplication/qtsinglecoreapplication.cpp

HEADERS  += \
    qmainwidget.h \
    controllerremapper.h \
    controllerwindow.h \
    dinputcorrelation.h \
    QtSingleApplication/qtlocalpeer.h \
    QtSingleApplication/QtLockedFile \
    QtSingleApplication/qtlockedfile.h \
    QtSingleApplication/QtSingleApplication \
    QtSingleApplication/qtsingleapplication.h \
    QtSingleApplication/qtsinglecoreapplication.h

RESOURCES += \
    resources.qrc

FORMS += \
    controllerwindow.ui
