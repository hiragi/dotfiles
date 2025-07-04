INSTALL      = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
prefix       = /home/hiroaki/.emacs.d/w3m/
datadir      = ${prefix}/share
infodir      = ${prefix}/info
lispdir      = $(datadir)/emacs/site-lisp/w3m
srcdir       = .
PACKAGEDIR   = NONE
ICONDIR      = NONE
ADDITIONAL_LOAD_PATH = NONE

SHELL        = /bin/sh


EMACS   = /usr/bin/emacs
VANILLA_FLAG = -q -no-site-file
FLAGS   = $(VANILLA_FLAG) -batch -l $(srcdir)/w3mhack.el $(ADDITIONAL_LOAD_PATH)

IGNORES = w3mhack.el

PACKAGE = emacs-w3m
TARBALL = $(PACKAGE)-$(VERSION).tar.gz
DISTDIR = $(PACKAGE)-$(VERSION)

default: all

all: lisp info

all-en: lisp info-en

all-ja: lisp info-ja

lisp: Makefile
	env test ! -f w3m-util.elc -o w3m-util.elc -nt w3m-util.el || $(MAKE) clean
	env test ! -f w3m-proc.elc -o w3m-proc.elc -nt w3m-proc.el || $(MAKE) clean
	$(EMACS) $(FLAGS) -f w3mhack-compile

what-where:
	@$(EMACS) $(FLAGS) -f w3mhack-what-where\
	 "$(lispdir)" "$(ICONDIR)" "$(PACKAGEDIR)" "$(infodir)"

info:
	cd doc && $(MAKE) EMACS="$(EMACS)"

info-en:
	cd doc && $(MAKE) EMACS="$(EMACS)" en

info-ja:
	cd doc && $(MAKE) EMACS="$(EMACS)" ja

install: install-lisp install-info

install-en: install-lisp install-info-en

install-ja: install-lisp install-info-ja

install-lisp: lisp
	@$(SHELL) $(srcdir)/mkinstalldirs $(lispdir);\
	for p in ChangeLog* *.el; do\
	  case "$$p" in\
	    $(IGNORES)) ;;\
	    *) echo " $(INSTALL_DATA) $$p $(lispdir)/$$p";\
	       $(INSTALL_DATA) $$p $(lispdir)/$$p;;\
	  esac;\
	done;\
	for p in *.elc; do\
	  if test -f "$$p"; then\
	    echo " $(INSTALL_DATA) $$p $(lispdir)/$$p";\
	    $(INSTALL_DATA) $$p $(lispdir)/$$p;\
	  fi;\
	done;\
	if test -f shimbun/shimbun.elc; then\
	  for p in `cd shimbun && echo *.el`; do\
	    echo " $(INSTALL_DATA) shimbun/$$p $(lispdir)/$$p";\
	    $(INSTALL_DATA) shimbun/$$p $(lispdir)/$$p;\
	  done;\
	  for p in `cd shimbun && echo *.elc`; do\
	    echo " $(INSTALL_DATA) shimbun/$$p $(lispdir)/$$p";\
	    $(INSTALL_DATA) shimbun/$$p $(lispdir)/$$p;\
	  done;\
	fi

install-icons:
	@if test $(ICONDIR) = NONE; then\
	  echo "You don't have to install icon files for \"$(EMACS)\".";\
	else\
	  $(SHELL) $(srcdir)/mkinstalldirs $(ICONDIR);\
	  for i in `cd icons && echo *.gif *.xpm`; do\
	    echo " $(INSTALL_DATA) icons/$$i $(ICONDIR)/$$i";\
	    $(INSTALL_DATA) icons/$$i $(ICONDIR)/$$i;\
	  done;\
	fi

install-icons30:
	@if test $(ICONDIR) = NONE; then\
	  echo "You don't have to install icon files for \"$(EMACS)\".";\
	else\
	  $(SHELL) $(srcdir)/mkinstalldirs $(ICONDIR);\
	  for i in `cd icons30 && echo *.gif *.xpm`; do\
	    echo " $(INSTALL_DATA) icons30/$$i $(ICONDIR)/$$i";\
	    $(INSTALL_DATA) icons30/$$i $(ICONDIR)/$$i;\
	  done;\
	fi

install-info: info
	cd doc && $(MAKE) EMACS="$(EMACS)" infodir="$(infodir)" install

install-info-en: info-en
	cd doc && $(MAKE) EMACS="$(EMACS)" infodir="$(infodir)" install-en

install-info-ja: info-ja
	cd doc && $(MAKE) EMACS="$(EMACS)" infodir="$(infodir)" install-ja

install-package:
	@if test $(PACKAGEDIR) = NONE; then\
	  echo "What a pity!  Your \"$(EMACS)\" does not support"\
		"a package system.";\
	else\
	  $(MAKE) lispdir="$(PACKAGEDIR)/lisp/w3m" install-lisp;\
	  $(MAKE) ICONDIR="$(PACKAGEDIR)/etc/images/w3m" install-icons30;\
	  $(MAKE) infodir="$(PACKAGEDIR)/info" install-info;\
	  echo "$(EMACS) $(FLAGS) -f w3mhack-make-package $(PACKAGEDIR)";\
	  $(EMACS) $(FLAGS) -f w3mhack-make-package $(PACKAGEDIR);\
	fi

install-package-ja:
	@if test $(PACKAGEDIR) = NONE; then\
	  echo "What a pity!  Your \"$(EMACS)\" does not support"\
		"a package system.";\
	else\
	  $(MAKE) lispdir="$(PACKAGEDIR)/lisp/w3m" install-lisp;\
	  $(MAKE) ICONDIR="$(PACKAGEDIR)/etc/images/w3m" install-icons30;\
	  $(MAKE) infodir="$(PACKAGEDIR)/info" install-info-ja;\
	  echo "$(EMACS) $(FLAGS) -f w3mhack-make-package $(PACKAGEDIR)";\
	  $(EMACS) $(FLAGS) -f w3mhack-make-package $(PACKAGEDIR);\
	fi

Makefile: Makefile.in config.status
	$(srcdir)/config.status

config.status: configure
	$(srcdir)/config.status --recheck

configure: configure.in aclocal.m4
	autoconf

dist: Makefile w3m.elc
	$(MAKE) tarball \
	  VERSION=`$(EMACS) $(FLAGS) -f w3mhack-version 2>/dev/null` \
	  BRANCH=`cvs status Makefile.in|grep "Sticky Tag:"|awk '{print $$3}'|sed 's,(none),HEAD,'`

tarball: CVS/Root CVS/Repository
	-rm -rf $(DISTDIR) $(TARBALL) `basename $(TARBALL) .gz`
	cvs -d `cat CVS/Root` -w export -d $(DISTDIR) -r $(BRANCH) `cat CVS/Repository`
	-cvs diff |( cd $(DISTDIR) && patch -p0 )
	for f in BUGS.ja w3m-e23.el; do\
	  if [ -f $(DISTDIR)/$${f} ]; then\
	    rm -f $(DISTDIR)/$${f} || exit 1;\
	  fi;\
	done
	find $(DISTDIR) -name .cvsignore | xargs rm -f
	find $(DISTDIR) -type d | xargs chmod 755
	find $(DISTDIR) -type f | xargs chmod 644
	cd $(DISTDIR) && autoconf
	chmod 755 $(DISTDIR)/configure $(DISTDIR)/install-sh
	tar -cf `basename $(TARBALL) .gz` $(DISTDIR)
	gzip -9 `basename $(TARBALL) .gz`
	rm -rf $(DISTDIR)

clean:
	-rm -rf $(PACKAGE)* ;\
	rm -f *~ *.elc shimbun/*.elc w3m-load.el w3m-kwds.el ;\
	rm -f doc/*~ doc/*.info doc/*.info-[0-9] doc/*.info-[0-9][0-9]

distclean: clean
	-rm -f config.log config.status config.cache Makefile doc/Makefile;\
	rm -fr autom4te*.cache

## Rules for the developers to check a portability for each module.
.SUFFIXES: .elc .el

.el.elc:
	echo "$(EMACS) $(FLAGS) -f w3mhack-batch-compile $*.el";\
	$(EMACS) $(FLAGS) -f w3mhack-batch-compile $*.el

slow: Makefile
	@for i in `$(EMACS) $(FLAGS) -f w3mhack-examine-modules 2>/dev/null`;\
	do $(MAKE) -s $$i; done

very-slow: clean keywords Makefile
	@args="$(VANILLA_FLAG) -batch";\
	args="$$args -l $(srcdir)/attic/addpath.el $(ADDITIONAL_LOAD_PATH)";\
	echo "=============================================";\
	echo "Compiling the 1st stage-----without elc files";\
	echo "=============================================";\
	for i in `$(EMACS) $(FLAGS) -f w3mhack-examine-modules 2>/dev/null`;\
	  do\
	  j=`echo $$i| sed 's/elc$$/el/g'`;\
	  echo "$(EMACS) ARGS -f batch-byte-compile $$j";\
	  $(EMACS) $$args -f batch-byte-compile $$j;\
	  mv $$i $$j"x";\
	done;\
	for i in `echo *.elx shimbun/*.elx`; do\
	  j=`echo $$i| sed 's/elx$$/elc/g'`;\
	  if test -f $$i; then mv $$i $$j; fi\
	done;\
	echo "==============================================";\
	echo "Compiling the 2nd stage-----with all elc files";\
	echo "==============================================";\
	for i in `$(EMACS) $(FLAGS) -f w3mhack-examine-modules 2>/dev/null`;\
	  do\
	  j=`echo $$i| sed 's/elc$$/el/g'`;\
	  echo "$(EMACS) ARGS -f batch-byte-compile $$j";\
	  $(EMACS) $$args -f batch-byte-compile $$j;\
	done

## Create the file w3m-kwds.el if it is needed for $(EMACS).
keywords:
	@ echo "$(EMACS) $(FLAGS)";\
	$(EMACS) $(FLAGS) -f w3mhack-check-colon-keywords-file ;\
	if test ! -f w3m-kwds.el; then\
	  echo "There is no need to bind colon keywords for \"$(EMACS)\".";\
	  echo "The file w3m-kwds.el is not created.";\
	fi
