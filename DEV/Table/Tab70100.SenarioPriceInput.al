table 70100 "Senario Price Input"
{
    Caption = 'Senario Price Input';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Report Date"; Date)
        {
            Caption = 'Report Date';
        }
        field(3; "Asset Token No."; Code[20])
        {
            Caption = 'Asset Token No.';
        }
        field(4; "Symbol / Asset Code"; Code[30])
        {
            Caption = 'Symbol / Asset Code';
        }
        field(5; "Standard Deviation (0.995)"; Decimal)
        {
            // Caption = 'Standard Deviation 1';
            DecimalPlaces = 0 : 8;

        }
        field(6; "Standard Deviation (0.94)"; Decimal)
        {
            // Caption = 'Standard Deviation 2';
            DecimalPlaces = 0 : 8;

        }
        field(7; PSR; Integer)
        {
            Caption = 'PSR';
        }
        field(8; "Sigma Scaling factor"; Decimal)
        {
            Caption = 'Sigma Scaling factor';
        }
        field(9; MPOR; Integer)
        {
            Caption = 'MPOR';
        }
        field(10; "CovertedUnderlyingprice"; Decimal)
        {
            Caption = 'CovertedUnderlyingprice';
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
