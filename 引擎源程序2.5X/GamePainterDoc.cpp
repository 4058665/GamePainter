/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CGamePainterDoc

IMPLEMENT_DYNCREATE(CGamePainterDoc, CDocument)

BEGIN_MESSAGE_MAP(CGamePainterDoc, CDocument)
END_MESSAGE_MAP()


// CGamePainterDoc ����/����

CGamePainterDoc::CGamePainterDoc()
{
	// TODO: �ڴ����һ���Թ������

}

CGamePainterDoc::~CGamePainterDoc()
{
}

BOOL CGamePainterDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: �ڴ�������³�ʼ������
	// (SDI �ĵ������ø��ĵ�)

	return TRUE;
}




// CGamePainterDoc ���л�

void CGamePainterDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: �ڴ���Ӵ洢����
	}
	else
	{
		// TODO: �ڴ���Ӽ��ش���
	}
}


// CGamePainterDoc ���

#ifdef _DEBUG
void CGamePainterDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CGamePainterDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG


// CGamePainterDoc ����
