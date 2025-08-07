table 50003 EQD_FullSp
{
    Caption = 'EQD_FullSp';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "Series Code"; Code[20])
        {
            Caption = 'Series Code';
        }
        field(3; "Derivative Name"; Text[200])
        {
        }
        field(4; "Contarct Price"; Decimal)
        {
        }
        field(5; "Contarct Underline Price"; Decimal)
        {
        }
        field(6; "Asset Token No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}