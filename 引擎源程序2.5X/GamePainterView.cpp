/*
   ����Դ������������ҵ����
   ��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��  ����޸ģ�12��9��
*/

#include "stdafx.h"
#include "GamePainterView.h"
#include "MusicBox.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

///////////////ȫ�ֱ���/////////////////////
MusicBox g_Music;
int addImage(lua_State* L);    //(path)���PNGͼƬ��ͼƬ�⣬��Ϸ����PNGͼƬ����Ĭ�����PNG��ʽ
int addJPG(lua_State* L);      //(path)���JPGͼƬ��ͼƬ�⣬��Ϸ��ͼһ��ϴ��Ҳ���Ҫ͸��������jpg��ʽ����Ч
int drawImage(lua_State* L);   //(id,x,y,left,width)��x,y������ͼƬ��ͼƬ�ü�����left���ü�width���
int drawImageR(lua_State* L);  //(id,x,y,sx,sy,w,h)��x,y������ͼƬ��ͼƬ�ü�����sx,sy���ü�һ��w*h�ľ���
int drawPoint(lua_State* L);   //(x,y,color)����һ����
int drawLine(lua_State* L);    //(x1,y1,x2,y2)����һ��ֱ��
int drawRect(lua_State* L);    //(x1,y1,x2,y2)�����߿����
int drawSolidRect(lua_State* L); //(x1,y1,x2,y2,color)����ʵ�ľ���
int drawText(lua_State* L);    //(x,y,text)����һ������
int drawTextR(lua_State* L);   //(text,x1,y1,x2,y2,format)�ھ��������������
int delImage(lua_State* L);    //(id)��ͼƬ��ж�ر��Ϊid��ͼƬ
int setClock(lua_State* L) ;   //(dT)����ʱ������ΪdT����λΪ����
int setCanvas(lua_State* L);   //(width,height)������Ϸ�����ߴ�
int setPen(lua_State* L);      //(color,weight)���õ�ǰ������ɫ����
int setFont(lua_State* L);     //(fontName,fontSize)���õ�ǰ����������ߴ�
int setCursor(lua_State* L);   //(cursorPath)�����Զ������ָ�룬��ʽΪ.cur��ͼƬ
int setBrush(lua_State* L);    //(color)���õ�ǰ��ˢ��ɫ
int setTextColor(lua_State*L); //(color)���õ�ǰ������ɫ
int setImageScale(lua_State*L);//(id,scale)�ı�ͼƬ������ߴ磬����������scale
int updateCanvas(lua_State* L);//������Ϸ����
int getImageW(lua_State* L);   //(id)��ȡͼƬ���
int getImageH(lua_State* L);   //(id)��ȡͼƬ�߶�
int addMusic(lua_State* L);    //(path)ע�������ļ������ֿ⣬Ŀǰ֧��mp3��ʽ
int delMusic(lua_State* L);    //(id)�����ֿ��Ƴ����Ϊid������
int playMusic(lua_State* L);   //(id)���ű��Ϊid������
int stopMusic(lua_State* L);   //(id)ֹͣ���ű��Ϊid������
int pauseMusic(lua_State* L);  //(id)��ͣ���ű��Ϊid������
int resumeMusic(lua_State* L); //(id)�������ű��Ϊid������
int setGameName(lua_State* L); //(name)������Ϸ���ڵı���
int getNetText(lua_State* L);  //(URL)��ȡָ��url�������ı���Դ
int getNetFile(lua_State* L);  //(URL,savePath)��ָ����url���������ļ������浽����·����savePathָ����
int utf8ToGB2312(lua_State* L);//(utfStr)ת�뺯������UTF-8ת��GB��
int unicodeToGB2312(lua_State* L);//(uniStr)ת�뺯������Unicodeת��GB��
int setNetOption(lua_State* L);//(���ӳ�ʱ�����ͳ�ʱ�����ճ�ʱ�����Դ���)����������������ʱ�ĳ�ʱ�ȴ�����
int beginThread(lua_State*L);  //(threadFuncName)lua����һ��������Ϊһ�����߳�ִ�У�ע�����lua�������ܴ��в���
int exitGame(lua_State* L);    //�˳���Ϸ
const luaL_Reg CLib[]= {  
	{"addImage", addImage},
	{"addJPG",addJPG},
	{"drawImage",drawImage},
	{"delImage",delImage},
	{"drawSolidRect",drawSolidRect},
	{"drawRect",drawRect},
	{"drawText",drawText},
	{"drawTextR",drawTextR},
	{"drawLine",drawLine},
	{"drawPoint",drawPoint},
	{"setPen",setPen},
	{"setBrush",setBrush},
	{"updateCanvas",updateCanvas},
	{"setTextColor",setTextColor},
	{"setFont",setFont},
	{"setImageScale",setImageScale},
	{"setClock",setClock},
	{"setCanvas",setCanvas},
	{"getImageW",getImageW},
	{"getImageH",getImageH},
	{"addMusic",addMusic},
	{"delMusic",delMusic},
	{"playMusic",playMusic},
	{"stopMusic",stopMusic},
	{"pauseMusic",pauseMusic},
	{"resumeMusic",resumeMusic},
	{"drawImageR",drawImageR},
	{"setGameName",setGameName},
	{"setCursor",setCursor},
	{"getNetText",getNetText},
	{"getNetFile",getNetFile},
	{"utf8ToGB2312",utf8ToGB2312},
	{"unicodeToGB2312",unicodeToGB2312},
	{"setNetOption",setNetOption},
	{"beginThread",beginThread},
	{"exitGame",exitGame},
	{NULL, NULL}  
};  
int imageManager();
void DrawGame();
void UTF8ToGB2312(CString utfStr,CString& gbstr);
void UnicodeToGB2312(LPCWSTR uniStr,CString& gbstr);
UINT luaThread(LPVOID pParam);
CString LoadLuaFile(CString fileName);
HCURSOR g_Cur;
bool   g_setMyCur=false;
bool   g_gameStart=false;
int    g_connectTOT=5000; //���ӳ�ʱ
int    g_sendTOT=5000;    //���ͳ�ʱ
int    g_receiveTOT=5000; //���ճ�ʱ
int    g_retryTime=1;  //���Դ���
CString g_threadName; //lua������̺߳�����
CWinThread* g_threadGroup[32];//�̶߳����飬�������32���߳�
lua_State*  g_stateGroup[32]; //lua״̬�����飬���߳����Ӧ
//////////////////////////////////////////////

IMPLEMENT_DYNCREATE(CGamePainterView, CView)

BEGIN_MESSAGE_MAP(CGamePainterView, CView)
	ON_WM_SIZE()
	ON_WM_TIMER()
	ON_WM_RBUTTONDOWN()
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONDBLCLK()
	ON_WM_MOUSEWHEEL()
	ON_WM_KEYDOWN()
	ON_WM_CHAR()
//	ON_WM_ERASEBKGND()
    ON_WM_MOUSEMOVE()
    ON_WM_LBUTTONUP()
	ON_WM_SETCURSOR()
END_MESSAGE_MAP()

CGamePainterView::CGamePainterView()
{
	//��ʼ��ͼƬ��
	g_MaxImage=32;
	g_ImageLib=(CxImage**)malloc(sizeof(UINT)*g_MaxImage);//new CxImage[g_MaxImage];//
	//��ʼ��Lua�ű�
	CLuaBox tempLua;
	CString configText=LoadLuaFile("config//config.lua");
	tempLua.initText(configText);
	CString  luaPath=tempLua.getString("scriptPath");
	luaPath+="//Game.lua";
	CString Code=LoadLuaFile(luaPath);
	g_Box.regFuncLib("Painter",CLib); //ע�ắ����
	g_Box.initText(Code);
}

// CGamePainterView ����
void CGamePainterView::OnDraw(CDC* pDC)
{
	DrawGame();
}

void DrawGame() //�ⲿ���������ͻ���DC����˫������ƣ�ʹͼ���ȶ�
{
	CDC* pDC=g_pView->GetDC();
	pDC->BitBlt(0,0,g_Width,g_Height,&g_BufDC,0,0,SRCCOPY);
	//pDC->DeleteDC();  //������������ʹ��DeleteDCҲ�ɰ�ȫ�ͷ���ʱDC
	g_pWnd->ReleaseDC(pDC);
}

int imageManager()
{
	if(g_nImage>g_MaxImage-2) //��ǰ����
	{
		CxImage** pTest=(CxImage**)realloc(g_ImageLib,(g_MaxImage+32)*sizeof(UINT)); //����ָ������
		if(pTest)
		{
			g_ImageLib=pTest;
			g_MaxImage+=32;
		}
		else
			return 0;   //�ڴ治�㣬����0����
	}
	return 1;
}

int updateCanvas(lua_State* L)
{
	DrawGame();
	return 0;
}

int addImage(lua_State* L)  //lua���ô˺���ע��ͼƬ��ȫ��ͼƬ�⣬����Ϊ(char* imageName)
{
	CString imageName;
	imageName=lua_tostring(L,1);
	if(!imageManager())
	{
		MessageBox(NULL,"�ڴ���Դ���㣬�������Ϸ��Դ����","��ʾ",0);
		lua_pushnumber(L,-1); //��lua����-1����
		return 1;
	}
	CxImage* image=new CxImage;
	image->Load(imageName,CXIMAGE_SUPPORT_PNG);
	g_ImageLib[g_nImage]=image;
	lua_pushnumber(L,g_nImage); //����ͼƬ�ڲ�ID,����������
	g_nImage++;
	return 1;
}

int addJPG(lua_State* L)
{
	CString imageName;
	imageName=lua_tostring(L,1);
	if(!imageManager())
	{
		MessageBox(NULL,"�ڴ���Դ���㣬�������Ϸ��Դ����","��ʾ",0);
		lua_pushnumber(L,-1); //��lua����-1����
		return 1;
	}
	CxImage* image=new CxImage;
	image->Load(imageName,CXIMAGE_SUPPORT_JPG);
	g_ImageLib[g_nImage]=image;
	lua_pushnumber(L,g_nImage); //����ͼƬ�ڲ�ID,����������
	g_nImage++;
	return 1;
}

int drawImage(lua_State* L)//lua���ô˺�����ָ��λ�û��ƿ���Ϊid��ͼƬ������Ϊ(int id , int x , int y, int cx,int dx)
{
	int id=lua_tointeger(L,1);
	int x=lua_tointeger(L,2);
	int y=lua_tointeger(L,3);
	int cx=lua_tointeger(L,4);//�ü����
	int dx=lua_tointeger(L,5);//�ü����
	int h=g_ImageLib[id]->GetHeight();
	if(dx==0)//�޲ü�
	{
		g_ImageLib[id]->Draw(g_BufDC.GetSafeHdc(),x,y);
	}
	else //�ü�һ����
	{
		RECT clipRect={x,y,dx+x,h+y}; //CxImage�ü��������������DC��
		x-=cx; //�ü�����ƶ�����ǰλ��
		g_ImageLib[id]->Draw(g_BufDC.GetSafeHdc(),x,y,-1,-1,&clipRect);
	}
	return 0;
}

int drawImageR(lua_State* L)//lua���ô˺�����ָ��λ�û��ƿ���Ϊid��ͼƬ������Ϊ(int id , int x , int y, int sx,int sy,int dx,int dy)
{
	int id=lua_tointeger(L,1);
	int x=lua_tointeger(L,2);
	int y=lua_tointeger(L,3);
	int sx=lua_tointeger(L,4);
	int sy=lua_tointeger(L,5);
	int dx=lua_tointeger(L,6);
	int dy=lua_tointeger(L,7);
	
	RECT clipRect={x,y,dx+x,dy+y}; //CxImage�ü��������������DC��
	x-=sx; //�ü�����ƶ�����ǰλ��
	y-=sy;
	g_ImageLib[id]->Draw(g_BufDC.GetSafeHdc(),x,y,-1,-1,&clipRect);
	return 0;
}

int drawPoint(lua_State* L)
{
	int x=lua_tointeger(L,1);
	int y=lua_tointeger(L,2);
	int color=lua_tointeger(L,3);
	g_BufDC.SetPixel(x,y,color);
	return 0;
}

int drawLine(lua_State* L)
{
	int x1=lua_tointeger(L,1);
	int y1=lua_tointeger(L,2);
	int x2=lua_tointeger(L,3);
	int y2=lua_tointeger(L,4);
	g_BufDC.MoveTo(x1,y1);
	g_BufDC.LineTo(x2,y2);
	return 0;
}

int drawSolidRect(lua_State* L)
{
	int x1=lua_tointeger(L,1);
	int y1=lua_tointeger(L,2);
	int x2=lua_tointeger(L,3);
	int y2=lua_tointeger(L,4);
	int color=lua_tointeger(L,5);
	g_BufDC.FillSolidRect(x1,y1,x2,y2,color);
	return 0;
}

int drawText(lua_State* L)
{
	int x=lua_tointeger(L,1);
	int y=lua_tointeger(L,2);
	CString text=lua_tostring(L,3);
	g_BufDC.TextOut(x,y,text,text.GetLength());
	return 0;
}

int drawTextR(lua_State* L)
{
	CString str=lua_tostring(L,1);
	int x1=lua_tointeger(L,2);
	int y1=lua_tointeger(L,3);
	int x2=lua_tointeger(L,4);
	int y2=lua_tointeger(L,5);
	int format=lua_tointeger(L,6);
	RECT rect={x1,y1,x2,y2};
	g_BufDC.DrawText(str,&rect,format);
	return 0;
}


int setImageScale(lua_State*L)
{
	int id=lua_tointeger(L,1);
	double scale=lua_tonumber(L,1);
	int w=g_ImageLib[id]->GetWidth();
	int h=g_ImageLib[id]->GetHeight();
	g_ImageLib[id]->Resample(w*scale,h*scale);
	return 0;
}

int setCursor(lua_State* L)
{
	CString name=lua_tostring(L,1);
	g_Cur=(HCURSOR)LoadImage(AfxGetInstanceHandle(),name,IMAGE_CURSOR,0,0,LR_LOADFROMFILE);
	g_setMyCur=true;
	SetCursor(g_Cur);
	return 0;
}

int getImageW(lua_State* L)
{
	int id=lua_tointeger(L,1);
	lua_pushinteger(L,g_ImageLib[id]->GetWidth());
	return 1;
}

int getImageH(lua_State* L)
{
	int id=lua_tointeger(L,1);
	lua_pushinteger(L,g_ImageLib[id]->GetHeight());
	return 1;
}

int setPen(lua_State* L)//lua���ô˺������û��ʲ��� (��ɫ�����)
{
	g_LineColor=lua_tointeger(L,1);
	int weight=lua_tointeger(L,2);
	g_Pen.Detach();
	g_Pen.CreatePen(PS_SOLID,weight,g_LineColor);
	CPen* p=g_BufDC.SelectObject(&g_Pen);
	p->DeleteObject(); //�ͷ�ԭ����
	return 0;
}

int setBrush(lua_State* L)
{
	g_BrushColor=lua_tointeger(L,1);
	g_Brush.Detach();
	g_Brush.CreateSolidBrush(g_BrushColor);
	CBrush* p=g_BufDC.SelectObject(&g_Brush);
	p->DeleteObject();
	return 0;
}

int setTextColor(lua_State*L)
{
	int color=lua_tointeger(L,1);
	g_BufDC.SetTextColor(color);
	return 0;
}

int setFont(lua_State* L)
{
	CString font=lua_tostring(L,1);
	int size=lua_tointeger(L,2);
	g_Font.Detach();
	g_Font.CreateFont(size, 
		0, 
		0, 
		0, 
		FW_LIGHT, 
		FALSE, 
		FALSE, 
		0, 
		GB2312_CHARSET,  
		OUT_DEFAULT_PRECIS, 
		CLIP_DEFAULT_PRECIS, 
		DEFAULT_QUALITY, 
		DEFAULT_PITCH | FF_SWISS, 
		font); 
	CFont* p=(CFont*)g_BufDC.SelectObject(&g_Font);
	p->DeleteObject();
	return 0;
}

int drawRect(lua_State* L)
{
	int x1=lua_tointeger(L,1);
	int y1=lua_tointeger(L,2);
	int x2=lua_tointeger(L,3);
	int y2=lua_tointeger(L,4);
	g_BufDC.Rectangle(x1,y1,x2,y2);
	return 0;
}

int delImage(lua_State* L)//lua���ô˺���ɾ�����Ϊid��ͼƬ
{
	int id=lua_tointeger(L,1);
	if(id<0 || id>g_nImage-1)
	{
		MessageBox(NULL,"delImage����Lua�ű��ṩ��id��������Ч��Χ","��ʾ",0);
		return 0;
	}
	delete g_ImageLib[id]; //����id���Ķ���
	g_nImage--; 
	for(int i=id;i<g_nImage;i++)
		g_ImageLib[i]=g_ImageLib[i+1]; //�������Ա�
	return 0;
}

int setClock(lua_State* L) //lua���ô˺�������ʱ������
{
	int dt=lua_tointeger(L,1);   //�����ʱ������(ms)
	g_DT=dt;
	g_pView->KillTimer(666);
	g_pView->SetTimer(666,g_DT,NULL);
	return 0;
}

int setGameName(lua_State* L)
{
	CString str;
	str=lua_tostring(L,1);
	g_pWnd->SetWindowTextA(str);
	return 0;
}

int setNetOption(lua_State* L)
{
	g_connectTOT=lua_tointeger(L,1);
	g_sendTOT=lua_tointeger(L,2);
	g_receiveTOT=lua_tointeger(L,3);
	g_retryTime=lua_tointeger(L,3);
	return 0;
}

///////���ڳߴ�////////
int setCanvas(lua_State* L)//lua���ô˺������û�����С
{
	g_Width=lua_tointeger(L,1);
	g_Height=lua_tointeger(L,2);
	g_BufBMP.Detach();
	g_BufBMP.CreateCompatibleBitmap(g_pView->GetDC(),g_Width,g_Height);
	CBitmap* p=(CBitmap*)g_BufDC.SelectObject(&g_BufBMP);
	p->DeleteObject();
	//�����µĴ��ڳߴ�
	int w=GetSystemMetrics(SM_CXFRAME)+g_Width;
	int h=GetSystemMetrics(SM_CYCAPTION)+GetSystemMetrics(SM_CYFRAME)+g_Height;
	g_pWnd->SetWindowPos(NULL,0,0,w,h,SWP_NOMOVE);
	DrawGame();
	return 0;
}

int getNetText(lua_State* L)
{
	CInternetSession netSession;
	CString url=lua_tostring(L,1);
	CString line;
	CString res;
	
	netSession.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT,g_connectTOT);          //���ӳ�ʱ
	netSession.SetOption(INTERNET_OPTION_SEND_TIMEOUT,   g_sendTOT);             //���ͳ�ʱ
	netSession.SetOption(INTERNET_OPTION_RECEIVE_TIMEOUT,g_receiveTOT);          //���ճ�ʱ
	netSession.SetOption(INTERNET_OPTION_DATA_SEND_TIMEOUT,g_sendTOT);           //���ݷ��ͳ�ʱ
	netSession.SetOption(INTERNET_OPTION_DATA_RECEIVE_TIMEOUT,g_receiveTOT);     //���ݽ��ճ�ʱ
	netSession.SetOption(INTERNET_OPTION_CONNECT_RETRIES, g_retryTime);          //���Դ���

	try
	{
		DWORD  dwFlag = INTERNET_FLAG_TRANSFER_BINARY|INTERNET_FLAG_RELOAD ;
		CHttpFile* pFile=(CHttpFile*)netSession.OpenURL(url,1,dwFlag);
		if(pFile)
		{
			while(pFile->ReadString(line))
				res+=line;
			/*char strBuf[512]={0};
			while(pFile->Read(strBuf,512))
				res=res+strBuf;*/
			pFile->Close();
			delete pFile;
		}
	}
	catch(CInternetException* e)
	{
	   res="������Դ��ȡʧ��";    
	   e->Delete();
	}
	netSession.Close();
    lua_pushstring(L,res);
    return 1;
}

int getNetFile(lua_State* L)
{
    CInternetSession netSession;
	CString strURL=lua_tostring(L,1);
	CString strFN=lua_tostring(L,2);
	BOOL bSucceed = TRUE;

	netSession.SetOption(INTERNET_OPTION_CONNECT_TIMEOUT,g_connectTOT);          //���ӳ�ʱ
	netSession.SetOption(INTERNET_OPTION_SEND_TIMEOUT,   g_sendTOT);             //���ͳ�ʱ
	netSession.SetOption(INTERNET_OPTION_RECEIVE_TIMEOUT,g_receiveTOT);          //���ճ�ʱ
	netSession.SetOption(INTERNET_OPTION_DATA_SEND_TIMEOUT,g_sendTOT);           //���ݷ��ͳ�ʱ
	netSession.SetOption(INTERNET_OPTION_DATA_RECEIVE_TIMEOUT,g_receiveTOT);     //���ݽ��ճ�ʱ
	netSession.SetOption(INTERNET_OPTION_CONNECT_RETRIES, g_retryTime);          //���Դ���
	try
	{
		CStdioFile * pFile = netSession.OpenURL(strURL); //������Ҫ�������ƴ洢��������ñ�׼�ļ�����

		if(pFile != NULL)
		{

			CFile cf;
			if(!cf.Open(strFN, CFile::modeCreate | CFile::modeWrite, NULL))
			{
				MessageBox(NULL,"���������ļ�ʧ�ܣ�����·���Ƿ�Ϸ���Ȩ���Ƿ�����!","��ʾ",0);
				return 0;
			}

			BYTE Buffer[512];
			ZeroMemory(Buffer, sizeof(Buffer));
			int nReadLen = 0;

			while((nReadLen = pFile->Read(Buffer, sizeof(Buffer))) > 0)
			{
				cf.Write(Buffer, nReadLen);
			}

			cf.Close();
			pFile->Close() ;
			delete pFile;
		}
	}
	catch (CInternetException* e)
	{
        e->Delete();
		bSucceed=FALSE;
	}
	netSession.Close() ;
	if(!bSucceed)
		DeleteFile(strFN);
    return 0;
}

int utf8ToGB2312(lua_State* L)
{
	CString utfStr=lua_tostring(L,1);
	CString gbStr;
	UTF8ToGB2312(utfStr,gbStr);
	lua_pushstring(L,gbStr);
	return 1;
}

int unicodeToGB2312(lua_State* L)
{
	WCHAR* uniStr=(WCHAR*)lua_tostring(L,1);
	CString gbStr;
	UnicodeToGB2312(uniStr,gbStr);
	lua_pushstring(L,gbStr);
	return 1;
}
//lua����һ���߳�
int beginThread(lua_State* L)
{
	int* pID=new int;
    *pID=lua_tointeger(L,1);  //�̱߳��(0-31)
	g_threadName=lua_tostring(L,2);
	g_stateGroup[*pID]=lua_newthread(g_Box.m_Lua);
	g_threadGroup[*pID]=AfxBeginThread(luaThread,pID);
	return 0;
}

int exitGame(lua_State* L)
{
	PostQuitMessage(0);
    return 0;
}

///////���ֽӿ�////////
int addMusic(lua_State* L)
{
	CString str;
	str=lua_tostring(L,1);
	int id=g_Music.addMusic(str);
	lua_pushinteger(L,id);
	return 1;
}

int delMusic(lua_State* L)
{
	int id=lua_tointeger(L,1);
    g_Music.del(id);
	return 0;
}

int playMusic(lua_State* L)
{
	int id=lua_tointeger(L,1);
	g_Music.play(id);
	return 0;
}

int stopMusic(lua_State* L)
{
	int id=lua_tointeger(L,1);
	g_Music.stop(id);
	return 0;
}

int pauseMusic(lua_State* L)
{	
	int id=lua_tointeger(L,1);
    g_Music.pause(id);
	return 0;
}

int resumeMusic(lua_State* L)
{
	int id=lua_tointeger(L,1);
	g_Music.resume(id);
	return 0;
}

/////////��������Ĺ��ߺ���///////////////
//��ȡ�ı��ļ�
CString LoadLuaFile(CString fileName)
{
	CFile luaFile(fileName,CFile::modeRead);   
	CArchive ar(&luaFile,CArchive::load);
	CString Code,str;
	while(ar.ReadString(str))  //����ű��ַ�
	{
		Code+=str;     //ReadString������뻻�з�
		Code+="\n";   //������ӻ��з������޷�����ע�ͺ���ĳ���
	}
	ar.Close();
	luaFile.Close();
	return Code;
}
//UTF8תGB2312��
void UTF8ToGB2312(CString utfStr,CString& gbStr) //UTF-8��һ�ֶ��ַ����룬�ʲ���MultiByteToWideChar������ת����ת�����GB��Ҳ�Ƕ��ֽ��ַ�����MultiByteToWideChar������ֻǿ��ת��ǰ�ĸ�ʽ
{ 
	int n=MultiByteToWideChar(CP_UTF8,0,utfStr,utfStr.GetLength(),NULL,0); //��һ�ε��ô˺�����ȡת����ĳ��ȣ���һ������ָ����Դ�����ʽ
	WCHAR * pChar = new WCHAR[n+1]; //����Ŀ���ִ��ռ�
	n=MultiByteToWideChar(CP_UTF8,0,utfStr,utfStr.GetLength(),pChar,n); //�ڶ��ε��ô���pChar����ʵ��ת��
	pChar[n]=0; 
	gbStr=pChar;
	delete pChar;
}
//UnicodeתGB2312��
void UnicodeToGB2312(LPCWSTR uniStr,CString& gbstr)
{
    int n=WideCharToMultiByte(CP_ACP,NULL,uniStr,-1,NULL,0,NULL,NULL); //��һ������ָ����Ŀ������ʽ
	char* pChar=new char[n+1];
	n=WideCharToMultiByte(CP_ACP,NULL,uniStr,-1,pChar,n,NULL,NULL);
	pChar[n]=0;
	gbstr=pChar;
	delete pChar;
}

//�����߳�
UINT luaThread(LPVOID pParam)
{
	int* pID=(int*)pParam;
    //lua_State* tempState=lua_newthread(g_Box.m_Lua);
	char threadName[128]={0};
	memcpy(threadName,g_threadName,g_threadName.GetLength());
	lua_getglobal(g_stateGroup[*pID],threadName);    //���غ���
	lua_pcall(g_stateGroup[*pID],0,0,0);             //���õ�ǰ������p2:����������p3:���ظ���

	DWORD ExitCode=0;
	GetExitCodeThread( g_threadGroup[*pID]->m_hThread,&ExitCode);
	//pΪ��Ҫ���ٵ�CWindThreadZָ��,���ڴ����߳�ʱ�����õ�.
	if(ExitCode>0 )
		AfxEndThread(ExitCode,true);
	delete pID;
	return 0;
}
//////////////View��ĳ�Ա����//////////////////////

CGamePainterView::~CGamePainterView()
{
	for(int i=0;i<g_nImage;i++)  //��������ͼƬ����
		delete g_ImageLib[i];
	free(g_ImageLib);    //�ͷ�ͼƬ��
}

BOOL CGamePainterView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: �ڴ˴�ͨ���޸�
	//  CREATESTRUCT cs ���޸Ĵ��������ʽ
	ModifyStyle(0,BS_OWNERDRAW);
	return CView::PreCreateWindow(cs);
}


#ifdef _DEBUG
void CGamePainterView::AssertValid() const
{
	CView::AssertValid();
}

void CGamePainterView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CGamePainterDoc* CGamePainterView::GetDocument() const // �ǵ��԰汾��������
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CGamePainterDoc)));
	return (CGamePainterDoc*)m_pDocument;
}
#endif //_DEBUG

///////////////////////////// CGamePainterView ��Ϣ�������/////////////////////////////////////////////////

void CGamePainterView::OnSize(UINT nType, int cx, int cy) //���ڸı��Сʱ����ȫ�ֳߴ���Ϣ
{
	g_Width=cx;
	g_Height=cy;
	CView::OnSize(nType, cx, cy);
}

void CGamePainterView::OnTimer(UINT_PTR nIDEvent)  //��Ϸʱ�ӣ�ÿһ�����ڵ��ÿ��ƽű�GameLoop����һ��
{
	g_Box.callVoidFunc("GameLoop");
	CView::OnTimer(nIDEvent);
}

void CGamePainterView::OnRButtonDown(UINT nFlags, CPoint point)
{
	g_Box.loadFunc("OnRDown");
	g_Box.pushInt(point.x);
	g_Box.pushInt(point.y);
    g_Box.callAnyFunc(2,0);
	CView::OnRButtonDown(nFlags, point);
}

void CGamePainterView::OnLButtonDown(UINT nFlags, CPoint point)
{
	g_Box.loadFunc("OnLDown");
	g_Box.pushInt(point.x);
	g_Box.pushInt(point.y);
	g_Box.callAnyFunc(2,0);
	CView::OnLButtonDown(nFlags, point);
}

void CGamePainterView::OnLButtonDblClk(UINT nFlags, CPoint point)
{
	g_Box.loadFunc("OnLDoubleClick");
	g_Box.pushInt(point.x);
	g_Box.pushInt(point.y);
	g_Box.callAnyFunc(2,0);
	CView::OnLButtonDblClk(nFlags, point);
}

BOOL CGamePainterView::OnMouseWheel(UINT nFlags, short zDelta, CPoint pt)
{
	g_Box.loadFunc("OnMouseWheel");
	g_Box.pushInt(pt.x);
	g_Box.pushInt(pt.y);
	g_Box.pushInt(zDelta);  //������
	g_Box.callAnyFunc(3,0); 
	return CView::OnMouseWheel(nFlags, zDelta, pt);
}

void CGamePainterView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags) //nRepCnt:�����ػ��Ĵ���
{
	g_Box.loadFunc("OnVKeyDown");
	g_Box.pushInt(nChar); //������
	g_Box.pushInt(nRepCnt);//�ظ�����
	g_Box.callAnyFunc(2,0);//���������
	CView::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CGamePainterView::OnChar(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	g_Box.loadFunc("OnCKeyDown");
	g_Box.pushInt(nChar); //�ַ���
	g_Box.pushInt(nRepCnt);//�ظ�����
	g_Box.callAnyFunc(2,0); //�ַ�������
	CView::OnChar(nChar, nRepCnt, nFlags);
}

void CGamePainterView::OnMouseMove(UINT nFlags, CPoint point)
{
	g_Box.loadFunc("OnMouseMove");
	g_Box.pushInt(point.x);
	g_Box.pushInt(point.y);
	g_Box.callAnyFunc(2,0);
	CView::OnMouseMove(nFlags, point);
}

void CGamePainterView::OnLButtonUp(UINT nFlags, CPoint point)
{
	g_Box.loadFunc("OnLUp");
	g_Box.pushInt(point.x);
	g_Box.pushInt(point.y);
	g_Box.callAnyFunc(2,0);
	CView::OnLButtonUp(nFlags, point);
}

BOOL CGamePainterView::OnSetCursor(CWnd* pWnd, UINT nHitTest, UINT message)
{
	if(g_setMyCur)
	{
		SetCursor(g_Cur);
		return TRUE;
	}
	return CView::OnSetCursor(pWnd, nHitTest, message);
}

