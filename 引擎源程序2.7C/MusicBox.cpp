/*
����Դ������������ҵ����
��ôȥӵ��һ���ʺ磬��ôȥӵ��һ����ķ�    ������2015��
*/

#include "StdAfx.h"
#include "MusicBox.h"

MusicBox::~MusicBox(void)
{
}

MusicBox::MusicBox()
{
	mciOpen.lpstrDeviceType="mpegvideo"; //��ʱֻ���mp3��ʽ
	m_nID=-1;
}

int MusicBox::addMusic(CString name)
{
	m_nID++;
	if(m_nID==MAX_MUSIC)
	{
		MessageBox(NULL,"���ֲ�������������Ϸ�����������","��ʾ",0);
		return -1;
	}

	mciOpen.lpstrElementName=name;
	MCIERROR mciErr;
	mciErr=mciSendCommand(0,MCI_OPEN,MCI_OPEN_TYPE|MCI_OPEN_ELEMENT,(DWORD)&mciOpen);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
		return -1;
	}
	m_ID[m_nID]=mciOpen.wDeviceID;
	return m_nID;
}

void MusicBox::play(int id)
{
	MCIERROR mciErr=mciSendCommand(m_ID[id],MCI_PLAY,0,(DWORD)&mciPlay);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
	}
}

void MusicBox::pause(int id)
{
	MCIERROR mciErr=mciSendCommand(m_ID[id],MCI_PAUSE,0,(DWORD)&mciPlay);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
	}
}

void MusicBox::stop(int id)
{
	MCIERROR mciErr=mciSendCommand(m_ID[id],MCI_STOP,0,(DWORD)&mciPlay);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
	}
}

void MusicBox::resume(int id)
{
	MCIERROR mciErr=mciSendCommand(m_ID[id],MCI_RESUME,0,(DWORD)&mciPlay);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
	}
}

void MusicBox::del(int id)  //ɾ��һ�������豸
{
	MCIERROR mciErr=mciSendCommand(m_ID[id],MCI_CLOSE,0,(DWORD)&mciPlay);
	if(mciErr)
	{
		char str[128];
		mciGetErrorString(mciErr,str,128);
		MessageBox(NULL,str,"��ʾ",0);
	}
	for(int i=id;i<m_nID;i++)
	{
		m_ID[i]=m_ID[i+1];
	}
}