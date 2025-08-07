tableextension 50303 "Excel Bufer Exte" extends "Excel Buffer"
{
    fields
    {
        // Add changes to table fields here

    }

    var
        myInt: Integer;

    procedure CreateNewExcelBookY(FileName: Text; SheetName: Text[250]; ReportHeader: Text; CompanyName2: Text; UserID2: Text)
    var
        myInt: Integer;
    begin
        CreateNewBook(SheetName);
        WriteSheet(ReportHeader, CompanyName2, UserID2);
        CloseBook;
        OpenExcel;
    end;
}