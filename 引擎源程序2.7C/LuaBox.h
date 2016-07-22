/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"
extern "C" {             //Lua��
#include "LuaLib//lua.h" 
#include "LuaLib//lualib.h" 
#include "LuaLib//lauxlib.h"
#pragma comment(lib,"LuaLib//luaX.lib")
}
#pragma once
class CLuaBox
{
public:
	lua_State* m_Lua;//Lua������
	CLuaBox();
	~CLuaBox();
	bool initText(CString Code);
	int getInteger(char* name);
	CString getString(char* name);
	double getNumber(char* name);
	void callVoidFunc(char* name);
	int callIntFunc(char* name);
	void loadFunc(char* name);
	void callAnyFunc(int nPara,int nRet);
	void regFunc(char* name,lua_CFunction address);
	void regFuncLib(char* libName,const luaL_Reg* Lib);
	void pushInt(int m);
	void pushNum(double m);
	void pushStr(char* m);
}; 

extern int LuaError;           //ȫ�ִ�����
extern CString LuaErrInfo;  //ȫ�ִ�����Ϣ
extern const luaL_Reg g_CLib[];
//������ȫ�ֱ���
extern char** g_StrArr;
extern double* g_NumArr;
extern int* g_IntArr;
extern int g_ArrCount;
extern int g_ArrType;
#define ARR_TYPE_STR 0
#define ARR_TYPE_NUM 1
#define ARR_TYPE_INT 2

extern void setTableInfo(int arrCount,int arrType);
