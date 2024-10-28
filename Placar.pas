unit Placar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrmPlacar = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label9: TLabel;
    Button3: TButton;
    Button4: TButton;
    Label12: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button11: TButton;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPlacar: TFrmPlacar;
  a, b, c, m, t : integer;

implementation




{$R *.dfm}

procedure TFrmPlacar.Button11Click(Sender: TObject);
begin
  m := StrToInt(label7.Caption) + 1;
  if StrToInt(label7.Caption) < 10 then
  label7.Caption := '0' + IntToStr(m);
  if StrToInt(label7.Caption) >= 10 then
  label7.Caption := IntToStr(m);


end;

procedure TFrmPlacar.Button12Click(Sender: TObject);
begin
  if StrToInt(label7.Caption) > 0 then
    m := StrToInt(label7.Caption) - 1;
  if StrToInt(label7.Caption) >= 10 then
      label7.Caption := IntToStr(m);
  if StrToInt(label7.Caption) <= 9 then
      label7.Caption := '0' + IntToStr(m)

end;

procedure TFrmPlacar.Button1Click(Sender: TObject);
begin
    a := StrToInt(label8.Caption) + 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if a >= 10 then
    begin
        label8.Caption := IntToStr(a);
        label8.Font.Color := clRed;
    end;
    if a < 10 then
    begin
        label8.Caption := '0' + IntToStr(a);
        label8.Font.Color := clBlack;
    end;
    if t >= m then
        label6.Font.Color := $0000C0FF;
    if t < m then
        label6.Font.Color := clWhite;
end;

procedure TFrmPlacar.Button2Click(Sender: TObject);
begin
if StrToInt(label8.Caption) > 0 then
    a := StrToInt(label8.Caption) - 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if a >= 10 then
    begin
        label8.Caption := IntToStr(a);
        label8.Font.Color := clRed;
    end;
    if a < 10 then
    begin
        label8.Caption := '0' + IntToStr(a);
        label8.Font.Color := clBlack;
    end;
    if t >= m then
         label6.Font.Color := $0000C0FF;
    if t < m then
         label6.Font.Color := clWhite;
end;

procedure TFrmPlacar.Button3Click(Sender: TObject);
begin
    b := StrToInt(label9.Caption) + 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if b >= 10 then
    begin
        label9.Caption := IntToStr(b);
        label9.Font.Color := clRed;
    end;
    if b < 10 then
    begin
        label9.Caption := '0' + IntToStr(b);
        label9.Font.Color := clBlack;
    end;
    if t >= m then
        label6.Font.Color := $0000C0FF;
    if t < m then
        label6.Font.Color := clWhite;
end;

procedure TFrmPlacar.Button4Click(Sender: TObject);
begin
    if StrToInt(label9.Caption) > 0 then
    b := StrToInt(label9.Caption) - 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if b >= 10 then
    begin
        label9.Caption := IntToStr(b);
        label9.Font.Color := clRed;
    end;
    if b < 10 then
    begin
        label9.Caption := '0' + IntToStr(b);
        label9.Font.Color := clBlack;
    end;
    if t >= m then
        label6.Font.Color := $0000C0FF;
    if t < m then
        label6.Font.Color := clWhite;
end;

procedure TFrmPlacar.Button5Click(Sender: TObject);
begin
    c := StrToInt(label12.Caption) + 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if c >= 10 then
    begin
        label12.Caption := IntToStr(c);
        label12.Font.Color := clRed;
    end;
    if c < 10 then
    begin
      label12.Caption := '0' + IntToStr(c);
        label12.Font.Color := clBlack;
    end;
    if t >= m then
        label6.Font.Color := $0000C0FF;
    if t < m then
        label6.Font.Color := clWhite;
end;

procedure TFrmPlacar.Button6Click(Sender: TObject);
begin
    if StrToInt(label12.Caption) > 0 then
    c := StrToInt(label12.Caption) - 1;
    t:= a + b + c;
    if t >= 10 then
        label6.Caption := IntToStr(t);
    if t < 10 then
        label6.Caption := '0' + IntToStr(t);
    if c >= 10 then
    begin
        label12.Caption := IntToStr(c);
        label12.Font.Color := clRed;
    end;
    if c < 10 then
    begin
      label12.Caption := '0' + IntToStr(c);
        label12.Font.Color := clBlack;
    end;
    if t >= m then
        label6.Font.Color := $0000C0FF;
    if t < m then
        label6.Font.Color := clWhite;
end;

end.
