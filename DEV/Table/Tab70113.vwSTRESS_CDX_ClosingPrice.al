table 70113 StressCDXClosingPrice
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ClosingDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; SeriesId; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(3; SeriesName; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(4; CommonClosePrice; Decimal)
        {

            DecimalPlaces = 4;
        }

        field(5; CommonUnderlyingClosePrice; Decimal)
        {
            DecimalPlaces = 4;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", ClosingDate, SeriesId)
        {
            Clustered = true;
        }
    }
}
