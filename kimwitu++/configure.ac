dnl Process this file with autoconf to produce a configure script.
AC_INIT(Kimwitu++, 2.3.11, piefel@informatik.hu-berlin.de, kimwitu++)
AC_PREREQ(2.50)
AC_COPYRIGHT([Copyright 2000, 2001, 2002, 2003, 2007  Humboldt-University Berlin])
AC_REVISION([$Id: configure.ac,v 1.26 2007-04-19 08:32:59 piefel Exp $])

AC_CONFIG_SRCDIR(src/gen.k)
AC_CONFIG_HEADERS(src/config.h)

AC_LANG([C++])

# Check for command line arguments (Universal Binary)
AC_MSG_CHECKING([whether a universal binary is requested])
universal=no
AC_ARG_WITH(universal, 
[  --with-universal        build a universal binary],
[case $withval in
  no)   ;;
  yes)  CXXCPP="${CXX:-g++} -E"
        CXX="${CXX:-g++} -arch i386 -arch ppc"
        CC="${CC:-gcc} -arch i386 -arch ppc"
	universal=yes
        ;;
  *)    CXXCPP="${CXX:-g++} -E"
        CXX="${CXX:-g++} $withval"
        CC="${CC:-gcc} $withval"
	universal=yes
        ;;
 esac
],[])
AC_MSG_RESULT($universal)

dnl Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_LEX
AC_PROG_YACC
AC_PROG_MAKE_SET
AC_PROG_INSTALL

dnl Checks for libraries.

dnl Checks for header files.
AC_CHECK_HEADERS(unistd.h)
AC_CHECK_HEADERS(string.h)
AC_CHECK_HEADERS([hash_set ext/hash_set], [AC_SUBST(hashset, [-DUSE_HASHSET])])

dnl Checks for typedefs, structures, and compiler characteristics.

dnl Checks for library functions.
AC_FUNC_MEMCMP
AC_TYPE_SIGNAL
AC_FUNC_VPRINTF

# Check for command line arguments (Python)
AC_ARG_WITH(python, 
[  --with-python           link with Python for debugging support],
[case $withval in
  no)   PYTHON=/usr/bin/false
        ;;
  yes)  AC_PATH_PROG(PYTHON, python, /usr/bin/false)
        ;;
  *)    PYTHON=$withval
        ;;
 esac
],[
  PYTHON=/usr/bin/false
])

if test $PYTHON = "/usr/bin/false"; then
  PYLIBS=
  PYOBJS=
  PYCFLAGS=
else
# The double [[]] are necessary for m4 quoting
eval `python - <<END
import sys
if "_tkinter" in sys.builtin_module_names:
  import distutils.sysconfig
  libs=distutils.sysconfig.get_config_var("LOCALMODLIBS")
  print "NEED_TKINTER=yes"
else:
  libs=""
ver="%d.%d" % sys.version_info[[:2]]
print 'PYLIBS="%s/lib/python%s/config/libpython%s.a %s"' % (sys.exec_prefix, ver, ver, libs)
print "PYOBJS=python.o"
print "PYCFLAGS=-I%s/include/python%s" % (sys.prefix, ver)
END`

 if test "$NEED_TKINTER" = "yes"; then
   AC_DEFINE(NEED_TKINTER, 1, [Define if your Python's _tkinter is builtin])
 fi

fi

AC_SUBST(PYTHON)
AC_SUBST(PYCFLAGS)
AC_SUBST(PYOBJS)
AC_SUBST(PYLIBS)

dnl Check for build architecture
dnl Actually this shouldn't matter at all; this test is wrong for cross compilation.
dnl The tr command line looks weird: "tr A-Z a-z" doesn't work on Solaris tr, and
dnl I'm not sure whether the correct "tr [:upper:] [:lower:]" works everywhere.
AC_MSG_CHECKING([how we like to call the build architecture])
arch=`uname -s | tr ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz`
if test X$arch = Xsunos && test `uname -r|cut -c1` -gt 4
    then arch=solaris
fi
if test X`echo $arch|cut -c1-6` = Xcygwin
    then arch=cygwin
fi
if test X$cross_compiling = Xyes
    then arch=cross
fi
AC_MSG_RESULT($arch)
AC_SUBST(arch)
AC_SUBST(PACKAGE_VERSION)

AC_CONFIG_FILES([Makefile src/Makefile])
AC_OUTPUT
