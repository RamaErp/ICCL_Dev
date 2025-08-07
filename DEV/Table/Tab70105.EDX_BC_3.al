table 70105 EDX_BC_3
{
    DataClassification = ToBeClassified;

    fields
    {
        field(70200; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(70201; "PositionDate"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70202; "CmCode"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70203; "FundsPayInPreDay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70204; "FundsPayOutPreDay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70205; "FundsPayInAtEODPrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70206; "FundsPayOutAtEODPrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70207; "ProprietaryMarginRTRMS"; Decimal)
        {
            DataClassification = ToBeClassified;
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