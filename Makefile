PREFIX ?= /usr
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions
PASSWORD_STORE_DIR ?= $(HOME)/.password-store
PASSWORD_STORE_EXTENSIONS_DIR ?= $(PASSWORD_STORE_DIR)/.extensions
MANDIR ?= $(PREFIX)/share/man
BASHCOMPDIR ?= /etc/bash_completion.d

all:
	@echo "pass-env is a shell script and does not need compilation, it can be simply executed."
	@echo ""
	@echo "To install it try \"make install\" or \"make local_install\" instead."
	@echo
	@echo "To run pass env one needs to have some tools installed on the system:"
	@echo " pass    password store"

install:
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -v -m 0644 man/pass-extension-env.1 "$(DESTDIR)$(MANDIR)/man1/pass-env.1"
	@install -v -d "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/"
	@install -v -m0755 src/env.bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/env.bash"
	@install -v -d "$(DESTDIR)$(BASHCOMPDIR)/"
	@install -v -m 644 completion/pass-env.bash.completion  "$(DESTDIR)$(BASHCOMPDIR)/pass-env"
	@echo
	@echo "pass-env is installed succesfully"
	@echo

local_install:
	@install -v -d "$(HOME)/.local/share/man/man1"
	@install -v -m 0644 man/pass-extension-env.1 "$(HOME)/.local/share/man/man1/pass-env.1"
	@install -v -d "$(PASSWORD_STORE_EXTENSIONS_DIR)/"
	@install -v -m0755 src/env.bash "$(PASSWORD_STORE_EXTENSIONS_DIR)/env.bash"
	# @install -v -d "$(HOME)/.config/bash_completion/"
	# @install -v -m 644 completion/pass-env.bash.completion "$(HOME)/.config/bash_completion/pass-env"
	@echo 'export PASSWORD_STORE_ENABLE_EXTENSIONS=true' >> $(HOME)/.bashrc
	@echo
	@echo "pass-env is installed succesfully"
	@echo

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/env.bash" \
		"$(DESTDIR)$(MANDIR)/man1/pass-env.1" \
		"$(DESTDIR)$(BASHCOMPDIR)/pass-env"

local_uninstall:
	@rm -vrf \
		"$(PASSWORD_STORE_EXTENSIONS_DIR)/env.bash" \
		"$(HOME)/.local/share/man/man1/pass-env.1"
		# "$(HOME)/.config/bash_completion/pass-env"

lint:
	shellcheck -s bash src/env.bash
	shellcheck -s bash src/envedit.bash

.PHONY: install uninstall lint
