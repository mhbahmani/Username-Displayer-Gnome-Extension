#!/usr/bin/make -f

_UUID = name@name.com
_BASE_MODULES = $(_UUID)/*
ifeq ($(strip $(DESTDIR)),)
	_INSTALL_BASE = $(HOME)/.local/share/gnome-shell/extensions
else
	_INSTALL_BASE = $(DESTDIR)/usr/share/gnome-shell/extensions
endif

ifeq (${user},)
	_USERNAME="${USER}"
else
	_USERNAME="${user}"
endif

install-local: _update_user_name
	rm -rf $(_INSTALL_BASE)/$(_UUID)
	mkdir -p $(_INSTALL_BASE)/$(_UUID)
	cp -r ./$(_UUID) $(_INSTALL_BASE)/

_update_user_name:
	sed -Ei "s/    text : \".*\",/    text : \"${_USERNAME}\",/"  name@name.com/extension.js

clean:
	echo "Clean"
