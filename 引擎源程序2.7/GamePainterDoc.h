// GamePainterDoc.h : CGamePainterDoc ��Ľӿ�
//


#pragma once


class CGamePainterDoc : public CDocument
{
protected: // �������л�����
	CGamePainterDoc();
	DECLARE_DYNCREATE(CGamePainterDoc)

// ����
public:

// ����
public:

// ��д
public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);

// ʵ��
public:
	virtual ~CGamePainterDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// ���ɵ���Ϣӳ�亯��
protected:
	DECLARE_MESSAGE_MAP()
};


