table 70117 StressCDXClientLevelMargin
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Date; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; CmCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(3; TmCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(4; ClientCode; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(5; Margin; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", Date, CmCode, TmCode, ClientCode)
        {
            Clustered = true;
        }
    }
}
