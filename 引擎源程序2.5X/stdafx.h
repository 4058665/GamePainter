/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#pragma once

#ifndef _SECURE_ATL
#define _SECURE_ATL 1
#endif

#ifndef VC_EXTRALEAN
#define VC_EXTRALEAN            // �� Windows ͷ���ų�����ʹ�õ�����
#endif

#include "targetver.h"

#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS      // ĳЩ CString ���캯��������ʽ��

// �ر� MFC ��ĳЩ�����������ɷ��ĺ��Եľ�����Ϣ������
#define _AFX_ALL_WARNINGS

#include <afxwin.h>         // MFC ��������ͱ�׼���
#include <afxext.h>         // MFC ��չ
#include <afxdisp.h>        // MFC �Զ�����

#ifndef _AFX_NO_OLE_SUPPORT
#include <afxdtctl.h>           // MFC �� Internet Explorer 4 �����ؼ���֧��
#endif
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>                     // MFC �� Windows �����ؼ���֧��
#endif // _AFX_NO_AFXCMN_SUPPORT

#ifdef _UNICODE
#if defined _M_IX86
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='x86' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_IA64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='ia64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#elif defined _M_X64
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='amd64' publicKeyToken='6595b64144ccf1df' language='*'\"")
#else
#pragma comment(linker,"/manifestdependency:\"type='win32' name='Microsoft.Windows.Common-Controls' version='6.0.0.0' processorArchitecture='*' publicKeyToken='6595b64144ccf1df' language='*'\"")
#endif
#endif

//����CxImage��
#include "CxImage/Include/ximage.h"
#pragma comment(lib,"CxImage/Lib/cximage.lib")
#pragma comment(lib,"CxImage/Lib/png.lib")
#pragma comment(lib,"CxImage/Lib/jasper.lib")
#pragma comment(lib,"CxImage/Lib/jbig.lib")
#pragma comment(lib,"CxImage/Lib/Jpeg.lib")
#pragma comment(lib,"CxImage/Lib/libpsd.lib")
#pragma comment(lib,"CxImage/Lib/libdcr.lib")
#pragma comment(lib,"CxImage/Lib/mng.lib")
#pragma comment(lib,"CxImage/Lib/Tiff.lib")
#pragma comment(lib,"CxImage/Lib/zlib.lib")
#include "GamePainter.h"
#include "GamePainterDoc.h"
#include "GamePainterView.h"
#include "MainFrm.h"
#include <memory.h>
#include <MMSystem.h>
#include <afxinet.h>
#include <wininet.h>
#include <comdef.h>
#pragma comment(lib,"winmm.lib")
///////////////////////////////////////////////////////ȫ�ֱ���/////////////////////////////////////////////////////////////////////
extern int g_Width; //�ͻ������
extern int g_Height;//�ͻ����߶�
extern CDC g_BufDC; //����DC
extern CBitmap g_BufBMP;//����λͼ
extern CFont g_Font;         //ȫ������
extern CPen g_Pen;
extern CBrush g_Brush;
extern COLORREF g_LineColor;
extern COLORREF g_BrushColor;
extern UINT g_DT;//ʱ������
extern CxImage** g_ImageLib;
extern int g_nImage;     //��ǰͼƬ��ʹ����
extern int g_MaxImage; //���ͼƬ������
extern CGamePainterView* g_pView;
extern CMainFrame* g_pWnd;
extern CLuaBox g_Box;  //lua�ű��������
//extern CInternetSession g_Session;//����Ự����

