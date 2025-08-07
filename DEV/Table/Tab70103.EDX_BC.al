table 70103 EDX_BC
{
    DataClassification = ToBeClassified;

    fields
    {
        field(70100; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(70101; "Report Date"; DateTime)
        {
            Caption = 'Report Date';
            DataClassification = ToBeClassified;
        }
        field(70103; "Asset Token No."; Code[8])
        {
            Caption = 'AssetCode';
            DataClassification = ToBeClassified;
        }
        field(70104; "Symbol"; text[10])
        {
            Caption = 'Symbol';
            DataClassification = ToBeClassified;
        }
        field(70105; "Standard Deviation (0.995)"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            Caption = 'Standard Deviation (0.995)';
        }

        field(70106; "Standard Deviation (0.94)"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            Caption = 'Standard Deviation (0.94)';
        }
        field(70111; "ClosingDate"; Date)
        {
            Caption = 'ClosingDate';
        }
        field(70107; "Series ID"; code[12])
        {
            Caption = 'Series ID';
        }
        field(70108; "Series Name"; Text[50])
        {
            Caption = 'Series Name';
        }
        field(70109; "CommonClosePrice"; Decimal)
        {
            Caption = 'Common Close Price';
        }
        field(70110; "CommonUnderLyingClosePrice"; Decimal)
        {
            Caption = 'Common Under Lying Close Price';
        }

        field(70112; PSR; Integer)
        {
            Caption = 'PSR';
        }
        field(70113; "Sigma Scaling factor"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            Caption = 'Sigma Scaling factor';
        }
        field(70114; MPOR; Integer)
        {
            Caption = 'MPOR';
        }
        field(70115; Date; DateTime)
        {
            Caption = 'Date';
        }

        field(70116; Expiry; Date)
        {
            Caption = 'Expiry';
        }

        field(70117; SeriesID; BigInteger)
        {
            Caption = 'Series ID';
        }

        field(70118; CallPut; Code[3])
        {
            Caption = 'Call Put';
        }

        field(70119; AssetCode; Code[12])
        {
            Caption = 'Asset Code';
        }

        field(70120; Strikerate; Decimal)
        {
            Caption = 'Strike Rate';
            DecimalPlaces = 4;
        }

        field(70121; TimeToExpiration; Decimal)
        {
            Caption = 'Time to Expiration';
            DecimalPlaces = 6;

        }

        field(70122; Rate; Integer)
        {
            Caption = 'Rate';
        }
        field(70123; Volatility; Decimal)
        {
            Caption = 'Volatility';
            DecimalPlaces = 6;
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