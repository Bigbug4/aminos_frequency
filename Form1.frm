VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "氨基酸序列特征提取器"
   ClientHeight    =   7425
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   11760
   LinkTopic       =   "Form1"
   ScaleHeight     =   7425
   ScaleWidth      =   11760
   StartUpPosition =   1  '所有者中心
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   10320
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.OptionButton Option1 
      Caption         =   "单肽"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   500
      Index           =   1
      Left            =   10125
      TabIndex        =   5
      Top             =   1320
      Width           =   1500
   End
   Begin VB.CommandButton Command3 
      Caption         =   "提取特征"
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
      Left            =   4365
      TabIndex        =   3
      Top             =   6360
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
      Left            =   7365
      TabIndex        =   2
      Top             =   6360
      Width           =   1800
   End
   Begin VB.OptionButton Option1 
      Caption         =   "二肽"
      BeginProperty Font 
         Name            =   "微软雅黑"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   500
      Index           =   2
      Left            =   10125
      TabIndex        =   1
      Top             =   2040
      Width           =   1500
   End
   Begin VB.CommandButton Command1 
      Caption         =   "打开文件"
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
      Left            =   1245
      TabIndex        =   0
      Top             =   6360
      Width           =   1800
   End
   Begin VB.TextBox Text1 
      Height          =   5000
      Left            =   840
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   6
      Top             =   960
      Width           =   9000
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
      Left            =   855
      TabIndex        =   4
      Top             =   360
      Width           =   9000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public code As String
Public outFile As String

Option Explicit
Private FormOldWidth As Long '保存窗体的原始宽度
Private FormOldHeight As Long '保存窗体的原始高度

'在调用ResizeForm前先调用本函数
Public Sub ResizeInit(FormName As Form)
Dim Obj As Control
FormOldWidth = FormName.ScaleWidth
FormOldHeight = FormName.ScaleHeight
On Error Resume Next
For Each Obj In FormName
Obj.Tag = Obj.Left & " " & Obj.Top & " " & Obj.Width & " " & Obj.Height & " "
Next Obj
On Error GoTo 0
End Sub
'按比例改变表单内各元件的大小，在调用ReSizeForm前先调用ReSizeInit函数
Public Sub ResizeForm(FormName As Form)
Dim Pos(4) As Double
Dim i As Long, TempPos As Long, StartPos As Long
Dim Obj As Control
Dim ScaleX As Double, ScaleY As Double
ScaleX = FormName.ScaleWidth / FormOldWidth '保存窗体宽度缩放比例
ScaleY = FormName.ScaleHeight / FormOldHeight '保存窗体高度缩放比例
On Error Resume Next
For Each Obj In FormName
StartPos = 1
For i = 0 To 4
'读取控件的原始位置与大小
TempPos = InStr(StartPos, Obj.Tag, " ", vbTextCompare)
If TempPos > 0 Then
Pos(i) = Mid(Obj.Tag, StartPos, TempPos - StartPos)
StartPos = TempPos + 1
Else
Pos(i) = 0
End If
'根据控件的原始位置及窗体改变大小的比例对控件重新定位与改变大小
Obj.Move Pos(0) * ScaleX, Pos(1) * ScaleY, Pos(2) * ScaleX, Pos(3) * ScaleY
Next i
Next Obj
On Error GoTo 0

End Sub

Public Sub delay(T As Single)
Dim time1 As Single
time1 = Timer
Do
DoEvents
Loop While Timer - time1 < T

End Sub

Private Sub Command1_Click()
  CommonDialog1.CancelError = True
  CommonDialog1.DialogTitle = "选定要打开的文件"
  CommonDialog1.InitDir = App.Path
  CommonDialog1.Filter = "txt文件(*.txt)|*.txt|所有文件(*.*)|*.*"
  CommonDialog1.InitDir = App.Path
  CommonDialog1.ShowOpen

  Label1.Caption = CommonDialog1.FileName
  
  Dim strFile As String
  Dim intFile As Integer
  Dim strData As String

  strFile = CommonDialog1.FileName
  intFile = FreeFile
  Open strFile For Input As intFile
  strData = StrConv(InputB(FileLen(strFile), intFile), vbUnicode)
  Text1.Text = strData
  Close intFile
  
End Sub

Private Sub Form_Load()

  Call ResizeInit(Me)
  Label1.FontSize = 12
  Command1.FontSize = 16
  Command2.FontSize = 16
  Command3.FontSize = 16
  Option1(1).FontSize = 16
  Option1(2).FontSize = 16
  Text1.FontSize = 10

End Sub

Private Sub Form_Resize()
  Call ResizeForm(Me)

End Sub

Private Sub Option1_Click(Index As Integer)
MsgBox Option1(Index).Caption
  Select Case Index
    Case 1
      code = "cmd /c python3 D:\VB\scripts\Feature_extraction\frequency\frequency20.py " & CommonDialog1.FileName
      outFile = "D:\VB\scripts\Feature_extraction\frequency\sequence_features20.txt"
    Case 2
      code = "cmd /c python3 D:\VB\scripts\Feature_extraction\frequency\frequency400.py " & CommonDialog1.FileName
      outFile = "D:\VB\scripts\Feature_extraction\frequency\sequence_features400.txt"
  End Select
  
End Sub

Private Sub Command2_Click()
  End
  
End Sub

Private Sub Command3_Click()
  Shell code
  delay (5)
  Form2.Show
  
End Sub



