// GamePainter.h : GamePainter Ӧ�ó������ͷ�ļ�
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"       // ������


// CGamePainterApp:
// �йش����ʵ�֣������ GamePainter.cpp
//

class CGamePainterApp : public CWinApp
{
public:
	CGamePainterApp();


// ��д
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};

extern CGamePainterApp theApp;