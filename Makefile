# -*- Makefile -*-

EMACS = emacs

# Compile with noninteractive and relatively clean environment.
BATCHFLAGS = -batch -q --no-site-file

SRCS = js2-mode.el js2-imenu-extras.el

OBJS = $(SRCS:.el=.elc)

%.elc: %.el
	${EMACS} $(BATCHFLAGS) -L . -f batch-byte-compile $^

all: $(OBJS)

clean:
	-rm -f $(OBJS)

test:
	${EMACS} $(BATCHFLAGS) -L . -l js2-mode.el -l js2-old-indent.el -l tests/parser.el\
	  -l tests/indent.el -l tests/externs.el -f ert-run-tests-batch-and-exit
