/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

// Ψһ��һ�� CGamePainterApp ����
CGamePainterApp theApp;

BOOL CGamePainterApp::InitInstance()
{
	// ���һ�������� Windows XP �ϵ�Ӧ�ó����嵥ָ��Ҫ
	// ʹ�� ComCtl32.dll �汾 6 ����߰汾�����ÿ��ӻ���ʽ��
	//����Ҫ InitCommonControlsEx()�����򣬽��޷��������ڡ�
	INITCOMMONCONTROLSEX InitCtrls;
	InitCtrls.dwSize = sizeof(InitCtrls);
	// ��������Ϊ��������Ҫ��Ӧ�ó�����ʹ�õ�
	// �����ؼ��ࡣ
	InitCtrls.dwICC = ICC_WIN95_CLASSES;
	InitCommonControlsEx(&InitCtrls);

	CWinApp::InitInstance();

	// ��ʼ�� OLE ��
	if (!AfxOleInit())
	{
		AfxMessageBox(IDP_OLE_INIT_FAILED);
		return FALSE;
	}
	AfxEnableControlContainer();
	// ��׼��ʼ��
	// ���δʹ����Щ���ܲ�ϣ����С
	// ���տ�ִ���ļ��Ĵ�С����Ӧ�Ƴ�����
	// ����Ҫ���ض���ʼ������
	// �������ڴ洢���õ�ע�����
	// TODO: Ӧ�ʵ��޸ĸ��ַ�����
	// �����޸�Ϊ��˾����֯��
	SetRegistryKey(_T("Ӧ�ó��������ɵı���Ӧ�ó���"));
	LoadStdProfileSettings(4);  // ���ر�׼ INI �ļ�ѡ��(���� MRU)
	// ע��Ӧ�ó�����ĵ�ģ�塣�ĵ�ģ��
	// �������ĵ�����ܴ��ں���ͼ֮�������
	CSingleDocTemplate* pDocTemplate;
	pDocTemplate = new CSingleDocTemplate(
		IDR_MAINFRAME,
		RUNTIME_CLASS(CGamePainterDoc),
		RUNTIME_CLASS(CMainFrame),       // �� SDI ��ܴ���
		RUNTIME_CLASS(CGamePainterView));
	if (!pDocTemplate)
		return FALSE;
	AddDocTemplate(pDocTemplate);

	// ������׼������DDE�����ļ�������������
	CCommandLineInfo cmdInfo;
	ParseCommandLine(cmdInfo);

	// ��������������ָ����������
	// �� /RegServer��/Register��/Unregserver �� /Unregister ����Ӧ�ó����򷵻� FALSE��
	if (!ProcessShellCommand(cmdInfo))
		return FALSE;

   ////////////////////////////���������ݳ�ʼ������//////////////////////////////
	//���³�ʼ������ȫ�ֱ���
    //��ȡȫ��ָ��
	g_pWnd=(CMainFrame*)AfxGetMainWnd();
	g_pView=(CGamePainterView*)g_pWnd->GetActiveView();
	//������ͼ�豸
	g_Font.CreateFont(13, 
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
		"����"); 
	g_Pen.CreatePen(PS_SOLID,1,g_LineColor);
	g_Brush.CreateSolidBrush(g_BrushColor);
	//��ʼ�������ͼDC
	g_BufDC.CreateCompatibleDC(g_pView->GetDC());
	g_BufBMP.CreateCompatibleBitmap(g_pView->GetDC(),g_Width,g_Height);
	g_BufDC.SelectObject(&g_BufBMP);
	g_BufDC.SelectObject(&g_Font);
	g_BufDC.SelectObject(&g_Pen);
	g_BufDC.SelectObject(&g_Brush);
	g_BufDC.SetBkMode(TRANSPARENT);
	g_BufDC.FillSolidRect(0,0,g_Width,g_Height,RGB(255,255,123));
	//����ʱ��
	g_DT=100; //100ms,10֡ÿ��
	//��������
	m_pMainWnd->ShowWindow(SW_SHOW);
	m_pMainWnd->UpdateWindow();
	//��Ϸ�����ʼ��
	g_Box.callVoidFunc("GameInit");//���ýű���ʼ������
	g_pView->SetTimer(666,g_DT,NULL);
	return TRUE;
}

CGamePainterApp::CGamePainterApp()
{
	// TODO: �ڴ˴���ӹ�����룬
	// ��������Ҫ�ĳ�ʼ�������� InitInstance ��
}

BEGIN_MESSAGE_MAP(CGamePainterApp, CWinApp)

END_MESSAGE_MAP()


// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();
// �Ի�����Դ
	enum { IDD = IDD_ABOUTBOX };
protected:
	virtual void DoDataExchange(CDataExchange* pDX); 
// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
END_MESSAGE_MAP()



