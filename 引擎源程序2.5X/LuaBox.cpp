/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"
#include "LuaBox.h"

int LuaError=0;
CString LuaErrInfo;

CLuaBox::CLuaBox()
{
	m_Lua = lua_open();    //��ʼ��Lua   
	luaL_openlibs(m_Lua);  //����Lua������
}

CLuaBox::~CLuaBox()
{
	lua_close(m_Lua);   //�ر�Lua
}

bool CLuaBox::initText(CString Code)
{
	int err=luaL_loadbuffer(m_Lua,Code,Code.GetLength(),"line") || lua_pcall(m_Lua,0,0,0);//����Lua�����ַ���
	if(err)
	{
		LuaErrInfo=lua_tostring(m_Lua,-1);
		lua_pop(m_Lua,1);
		return false;
	}
	return true;
}

int CLuaBox::getInteger(char* name)
{
	lua_getglobal(m_Lua,name); 
	if(!lua_gettop(m_Lua))  //��ջΪ�գ�˵������������
	{
		LuaError=9;
		LuaErrInfo.Format("δ�ҵ���Ϊ'%s'�ı���",name);
		return 0;
	}
	else
	{
		int val=lua_tointeger(m_Lua,-1);
		lua_pop(m_Lua,1);
		return val;
	}
}

double CLuaBox::getNumber(char* name)
{
	lua_getglobal(m_Lua,name); 
	if(!lua_gettop(m_Lua))  //��ջΪ�գ�˵������������
	{
		LuaError=9;
		LuaErrInfo.Format("δ�ҵ���Ϊ'%s'�ı���",name);
		return 0;
	}
	else
	{
		double val=lua_tonumber(m_Lua,-1);
		lua_pop(m_Lua,1);
		return val;
	}
}

CString CLuaBox::getString(char* name)
{
   lua_getglobal(m_Lua,name);
   if(!lua_gettop(m_Lua))  //��ջΪ�գ�˵������������
   {
	   LuaError=9;
	   LuaErrInfo.Format("δ�ҵ���Ϊ'%s'�ı���",name);
	   return 0;
   }
   else
   {
	   CString val=lua_tostring(m_Lua,-1);
	   lua_pop(m_Lua,1);
	   return val;
   }
}

void CLuaBox::pushInt(int m)
{
	lua_pushinteger(m_Lua,m);
}
void CLuaBox::pushStr(char* m)
{
	lua_pushstring(m_Lua,m);
}
void CLuaBox::pushNum(double m)
{
	lua_pushnumber(m_Lua,m);
}

void CLuaBox::loadFunc(char* name)
{
	lua_getglobal(m_Lua,name);    //���غ���
}
//�������⺯������������ѹջ������ֵ���н���
void CLuaBox::callAnyFunc(int nPara,int nRet)
{
	LuaError=lua_pcall(m_Lua,nPara,nRet,0);  //���õ�ǰ������p2:����������p3:���ظ���

	if(LuaError)
	{
		LuaErrInfo=lua_tostring(m_Lua, -1);//��ӡ������ 
		lua_pop(m_Lua, 1);
	}
}

//���ô���Lua����
void CLuaBox::callVoidFunc(char* name) 
{
	lua_getglobal(m_Lua,name);    //���غ���
	LuaError=lua_pcall(m_Lua,0,0,0);            //���õ�ǰ������p2:����������p3:���ظ���

	if(LuaError)
	{
		LuaErrInfo=lua_tostring(m_Lua, -1);//��ӡ������ 
		lua_pop(m_Lua, 1);
	}
}

//���÷����������޲κ���
int CLuaBox::callIntFunc(char* name)
{
	lua_getglobal(m_Lua,name);    //���غ���
	LuaError=lua_pcall(m_Lua,0,1,0);            //���õ�ǰ������p2:����������p3:���ظ���

	if(LuaError)
	{
		LuaErrInfo=lua_tostring(m_Lua, -1);//��ӡ������ 
		lua_pop(m_Lua, 1);
	}

	int r=lua_tointeger(m_Lua,-1);
	lua_pop(m_Lua,1);
	return r;
}

//��Luaע��C����
void CLuaBox::regFunc(char* name,lua_CFunction address)
{
	lua_register(m_Lua,name,address);
}
//��Luaע��C������
void CLuaBox::regFuncLib(char* libName,const luaL_Reg* Lib)
{
	luaL_register(m_Lua,libName,Lib);
}

///////////////////Ϊ����ǿ���ܣ�����ȫ�ֱ����뺯������lua//////////////////////
//������ȫ�ֱ���
char** g_StrArr;
double* g_NumArr;
int* g_IntArr;
int g_ArrCount;
int g_ArrType;
#define ARR_TYPE_STR 0
#define ARR_TYPE_NUM 1
#define ARR_TYPE_INT 2
//������ȫ�ֺ���
void setTableInfo(int arrCount,int arrType)
{
    g_ArrCount=arrCount;
	g_ArrType=arrType;
}

int getTable(lua_State *L)          //��lua��������
{  
	int i;
	lua_newtable(L);  
    if(g_ArrType==ARR_TYPE_NUM)
		for(i=0; i<g_ArrCount; i++)  
		{  
			lua_pushnumber(L, i+1);  
			lua_pushnumber(L, g_NumArr[i]);  
			lua_settable(L, -3);  
		}  
	else if(g_ArrType==ARR_TYPE_INT)
		for(i=0; i<g_ArrCount; i++)  
		{  
			lua_pushnumber(L, i+1);  
			lua_pushnumber(L, g_IntArr[i]);  
			lua_settable(L, -3);  
		}  
	else if(g_ArrType==ARR_TYPE_STR)
		for(i=0; i<g_ArrCount; i++)  
		{  
			lua_pushnumber(L, i+1);  
			lua_pushstring(L, g_StrArr[i]);  
			lua_settable(L, -3);  
		}  
	return 1;  
}  

//��ע���C�����⣬ÿһ���Ǹ�luaL_Reg�ṹ�壬ע����{NULL,NULL}��β
const luaL_Reg g_CLib[] = {  
	{"getTable", getTable},  
	{NULL, NULL}  
};  
/*
ע��C����������Ϊ
    luaL_register(L, ����, luaL_Reg����)
��lua������ʹ��ʱ�����Ϊ
    require("����")
    ����.������(...)
*/
