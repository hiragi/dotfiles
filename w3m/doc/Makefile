.SUFFIXES: .texi .info

INSTALL      = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_INFO = install-info
prefix       = /home/hiroaki/.emacs.d/w3m/
infodir      = ${prefix}/info
srcdir       = .
subdir       = doc
top_srcdir   = ..
ADDITIONAL_LOAD_PATH = NONE

SHELL        = /bin/sh


MAKEINFO     = no
TEXI2DVI     = false
PTEX         = false
JBIBTEX      = false
EMACS        = /usr/bin/emacs
VANILLA_FLAG = -q -no-site-file
FLAGS        = $(VANILLA_FLAG) -batch -l ./w3mhack.el $(ADDITIONAL_LOAD_PATH)
EMACSINFO    = cd $(top_srcdir) && $(EMACS) $(FLAGS) -f w3mhack-makeinfo

INFO_DEPS_EN = emacs-w3m.info
INFO_DEPS_JA = emacs-w3m-ja.info
INFO_DEPS    = $(INFO_DEPS_EN) $(INFO_DEPS_JA)

default: $(INFO_DEPS)

en: $(INFO_DEPS_EN)

ja: $(INFO_DEPS_JA)

version.texi: $(top_srcdir)/w3m.el
	@version=`cd $(top_srcdir)\
		&& $(EMACS) $(FLAGS) -f w3mhack-version 2>/dev/null`;\
	echo "@set VERSION $$version"> version.texi

emacs-w3m.info: version.texi emacs-w3m.texi

emacs-w3m-ja.info: version.texi emacs-w3m-ja.texi

.texi.info:
	@texi=$<;\
	case "$$texi" in \
	  *-ja.texi) \
	    rm -f $@ ;\
	    $(EMACSINFO) $$texi ;;\
	  *) \
	    if test "$(MAKEINFO)" = "no"; then \
	      rm -f $@ ;\
	      $(EMACSINFO) $$texi ;\
	    else \
	      echo "Formatting $$texi using $(MAKEINFO)..." ;\
	      LC_ALL=C $(MAKEINFO) -o $@ $$texi ;\
	      echo "Formatting $$texi using $(MAKEINFO)...done" ;\
	    fi ;;\
	esac

install: $(INFO_DEPS)
	$(SHELL) $(top_srcdir)/mkinstalldirs $(infodir)
	@list='$(INFO_DEPS)';\
	for file in $$list; do\
	  for ifile in `echo $$file $$file-[0-9] $$file-[0-9][0-9]`; do\
	    if test -f $$ifile; then\
	      echo " $(INSTALL_DATA) $$ifile $(infodir)/$$ifile";\
	      $(INSTALL_DATA) $$ifile $(infodir)/$$ifile;\
	    else : ; fi;\
	  done;\
	done
	@if $(SHELL) -c $(INSTALL_INFO)' --version| sed 1q\
		| fgrep -s -v -i debian'>/dev/null 2>&1; then\
	  list='$(INFO_DEPS)';\
	  for file in $$list; do\
	    if test -f $(infodir)/$$file; then\
	      echo " $(INSTALL_INFO) --info-dir=$(infodir) $(infodir)/$$file";\
	      $(INSTALL_INFO) --info-dir=$(infodir) $(infodir)/$$file || :;\
	    else : ; fi\
	  done;\
	else : ; fi

install-en: $(INFO_DEPS_EN)
	$(MAKE) INFO_DEPS='$(INFO_DEPS_EN)' EMACS="$(EMACS)"\
		infodir="$(infodir)" install

install-ja: $(INFO_DEPS_JA)
	$(MAKE) INFO_DEPS='$(INFO_DEPS_JA)' EMACS="$(EMACS)"\
		infodir="$(infodir)" install

dvi: dvi-en dvi-ja

dvi-en: emacs-w3m.dvi

dvi-ja: emacs-w3m-ja.dvi

emacs-w3m.dvi: version.texi emacs-w3m.texi

emacs-w3m-ja.dvi: version.texi emacs-w3m-ja.texi

.texi.dvi:
	@texi=$<;\
	case "$$texi" in \
	  *-ja.texi) \
	    env TEX=$(PTEX) BIBTEX=$(JBIBTEX) $(TEXI2DVI) -l ja -o $@ $$texi ;;\
	  *) \
	    $(TEXI2DVI) -o $@ $$texi ;;\
	esac

clean:
	-rm -rf *~ *.info *.info-[0-9] *.info-[0-9][0-9] *.dvi *.ps missfont.log

distclean: clean
	-rm -f Makefile
