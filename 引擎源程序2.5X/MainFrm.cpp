/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"
#include "GamePainter.h"

#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CMainFrame

IMPLEMENT_DYNCREATE(CMainFrame, CFrameWnd)

BEGIN_MESSAGE_MAP(CMainFrame, CFrameWnd)

	ON_WM_DESTROY()
END_MESSAGE_MAP()


// CMainFrame ����/����

CMainFrame::CMainFrame()
{

}

CMainFrame::~CMainFrame()
{
}


BOOL CMainFrame::PreCreateWindow(CREATESTRUCT& cs)
{
	if( !CFrameWnd::PreCreateWindow(cs) )
		return FALSE;

    //����ȥ����WS_THICKFRAME��WS_MAXIMIZEBOX����
	cs.style = WS_OVERLAPPED | WS_CAPTION | FWS_ADDTOTITLE
		  | WS_MINIMIZEBOX | WS_SYSMENU;
	//cs.style&=(~WS_THICKFRAME); //��ֹ�����ı䴰�ڳߴ�
	//cs.style&=(~WS_MAXIMIZEBOX);

	return TRUE;
}

//���ش˺���ȥ���˵���
BOOL CMainFrame::Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle , const RECT& rect , CWnd* pParentWnd , LPCTSTR lpszMenuName , DWORD dwExStyle , CCreateContext* pContext)
{
	return CFrameWnd::CreateEx(dwExStyle,lpszClassName,lpszWindowName,dwStyle,
		rect.left,rect.top,rect.right-rect.left,rect.bottom-rect.top,
		pParentWnd->GetSafeHwnd(),
		NULL,              //�޲˵�
		(LPVOID)pContext);
}


// CMainFrame ���

#ifdef _DEBUG
void CMainFrame::AssertValid() const
{
	CFrameWnd::AssertValid();
}

void CMainFrame::Dump(CDumpContext& dc) const
{
	CFrameWnd::Dump(dc);
}

#endif //_DEBUG


//�����˳�ʱ��һЩ��������ʲôҲ���ԣ�

void CMainFrame::OnDestroy()
{
	CFrameWnd::OnDestroy();
    g_Box.callVoidFunc("OnExit");
}
