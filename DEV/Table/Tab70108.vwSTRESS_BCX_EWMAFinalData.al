table 70108 vwSTRESS_BCX_EWMAFinalData
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ReportDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; AssetId; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(3; AssetCode; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(4; DailyEWMA; Decimal)
        {
            DecimalPlaces = 9;
        }

        field(5; MPORIdentifier; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", AssetId, ReportDate)
        {
            Clustered = true;
        }
    }
}
