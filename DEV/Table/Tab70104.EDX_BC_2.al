table 70104 EDX_BC_2
{
    DataClassification = ToBeClassified;

    fields
    {
        field(70100; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(70101; "Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70102; "CmCode"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70103; "TmCode"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70104; "ClientCode"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70105; "ProductType"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(70106; "SeriesID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70107; "StrikePrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70108; "CallPut"; Code[2])
        {
            DataClassification = ToBeClassified;
        }
        field(70109; "AssetCode"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70153; "Series Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(70154; "MarketLot"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70155; "UnderLyingId"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70156; "PreDayClosePrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70157; "TodayClosePrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70158; "CPCode"; Code[14])
        {
            DataClassification = ToBeClassified;
        }
        field(70159; "NetQty"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70160; "NetValue"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70161; "Margin"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70162; "Expiry"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(70163; "TimeToExpiration"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70164; "Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70165; "Volatility"; Integer)
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