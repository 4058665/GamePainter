/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "stdafx.h"

/////////////////////////////////////ȫ�ֱ�������////////////////////////////////////////
int g_Width; //�ͻ������
int g_Height;//�ͻ����߶�
CDC g_BufDC; //����DC
CBitmap g_BufBMP;//����λͼ
CPen g_Pen;
CBrush g_Brush;
COLORREF g_LineColor=RGB(0,0,0);//ȫ��������ɫ
COLORREF g_BrushColor=RGB(255,255,123);//ȫ�ֻ�ˢ��ɫ
CFont g_Font;   
UINT g_DT;//ʱ������

CxImage** g_ImageLib;
int g_nImage=0;
int g_MaxImage=32; //���ͼƬ������
CGamePainterView* g_pView;
CMainFrame* g_pWnd;

CLuaBox g_Box; //lua�ű��������
//CInternetSession g_Session;//����Ự����