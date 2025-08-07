table 70101 "Option Pricing Input"
{
    Caption = 'Option Pricing Input';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Sr. No';
            AutoIncrement = true;
        }
        field(2; "Report Date"; Date)
        {
            Caption = 'Report Date';
        }
        field(3; "Expiry Date"; Date)
        {
            Caption = 'Expiry';
        }
        field(4; "Series ID"; Code[20])
        {
            Caption = 'Series ID';
        }
        field(5; "Option Type"; Option)
        {
            Caption = 'Call Put';
            OptionMembers = P,C,F; // Assuming only Put and Call
            OptionCaption = 'P,C,F';
        }
        field(6; "Asset Code"; Code[10])
        {
            Caption = 'Asset Code';
        }
        field(7; "Actual Spot Rate"; Decimal)
        {
            Caption = 'Actual Spot Rate';
        }
        field(8; "Strike Rate (X)"; Decimal)
        {
            Caption = 'Strike Rate';
        }
        field(9; "Time to Expiration (T)"; Decimal)
        {
            Caption = 'Time to Expiration';
            Description = 'Calculated as difference in days / 365';
            DecimalPlaces = 0 : 8;
        }
        field(10; "Interest Rate (r)"; Decimal)
        {
            Caption = 'Rate';
        }
        field(11; "Volatility (v)"; Decimal)
        {
            Caption = 'Volatility';
            DecimalPlaces = 0 : 10;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
