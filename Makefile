OPENRESTY_PREFIX=/usr/local/openresty

PREFIX ?= /usr/local/openresty
LUA_INCLUDE_DIR ?= $(PREFIX)/include
LUA_LIB_DIR ?= $(PREFIX)/lualib
INSTALL ?= install

.PHONY: all linux clean install uninstall

all:
	@echo make linux

linux: ctime.so

ctime.so: ctime.c
	gcc --shared -Wall -fPIC -o2 $^ -o $@

install:
	$(INSTALL) -d $(LUA_LIB_DIR)
	$(INSTALL) ctime.so $(LUA_LIB_DIR)

uninstall:
	rm -rf $(LUA_LIB_DIR)/ctime.so

clean:
	rm -rf ctime.so
