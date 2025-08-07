table 70120 "Client Level Margin"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Date"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "CmCode"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(3; "TmCode"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(4; "ClientCode"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(5; "Margin"; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(8; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", "ClientCode", "Date")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Add logic if necessary
    end;
}
