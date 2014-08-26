#include <stdio.h>
#include <sys/time.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

static int
get_time(lua_State *L) {
    struct timeval time;

    gettimeofday(&time, NULL);

    double second = time.tv_sec;
    double usec = time.tv_usec;

    lua_pushnumber(L, second);
    lua_pushnumber(L, usec);

    return 2;
}

int
luaopen_ctime(lua_State *L) {
    static const luaL_Reg time_lib[] = {
        {"get_time", get_time},
        {NULL, NULL}
    };

    lua_newtable(L);
    luaL_register(L, NULL, time_lib);

    return 1;
}
