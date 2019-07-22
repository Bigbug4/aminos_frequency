VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "氨基酸序列特征提取器"
   ClientHeight    =   7425
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11760
   LinkTopic       =   "Form2"
   ScaleHeight     =   7425
   ScaleWidth      =   11760
   StartUpPosition =   1  '所有者中心
   Begin VB.TextBox Text1 
      Height          =   5025
      Left            =   600
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   960
      Width           =   10515
   End
   Begin VB.CommandButton Command1 
      Caption         =   "返回"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   750
      Left            =   2085
      TabIndex        =   1
      Top             =   6480
      Width           =   1800
   End
   Begin VB.CommandButton Command2 
      Caption         =   "退出"
      BeginProperty Font 
         Name            =   "宋体"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   750
      Left            =   7125
      TabIndex        =   0
      Top             =   6480
      Width           =   1800
   End
   Begin VB.Label Label1 
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   720
      TabIndex        =   3
      Top             =   360
      Width           =   10425
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()

  Call Form1.ResizeInit(Me)
  Label1.FontSize = 12
  Label1.Caption = Form1.outFile
  Command1.FontSize = 16
  Command2.FontSize = 16
  Text1.FontSize = 10
  
  Dim strFile As String
  Dim intFile As Integer
  Dim strData As String

  strFile = Form1.outFile
  intFile = FreeFile
  Open strFile For Input As intFile
  strData = StrConv(InputB(FileLen(strFile), intFile), vbUnicode)
  Text1.Text = strData
  Close intFile
  
End Sub

Private Sub Form_Resize()
  Call Form1.ResizeForm(Me)
  
End Sub
  
Private Sub Command1_Click()
 Unload Me
 
End Sub

Private Sub Command2_Click()
 End
 
End Sub


