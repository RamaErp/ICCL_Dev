table 70124 "Final Stress Loss Inputs"
{
    Caption = 'Final Stress Loss Inputs';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(2; "CmCode"; Code[10]) { }
        field(3; "TmCode"; Code[10]) { }
        field(4; "Client Code"; Code[20]) { }
        field(5; "Product Type"; Code[10]) { }
        field(6; "Series ID"; Code[20]) { }
        field(7; "Strike Price"; Decimal) { }
        field(8; "Call/Put"; Code[2])
        {
            // OptionMembers = P,C,F;
            // OptionCaption = 'Put, Call, Future';
        }
        field(9; "Asset Code"; Code[10]) { }
        field(10; "Series Code"; Code[20]) { }
        field(11; "Market Lot"; Integer) { }
        field(12; "Underlying ID"; Code[20]) { }
        field(13; "Pre Day Close Price"; Decimal)
        {
            Caption = 'PreDayClosePrice (A)';
        }
        field(14; "Today Close Price"; Decimal)
        {
            Caption = 'TodayClosePrice (B)';
        }
        field(15; "CP Code"; Code[10]) { }
        field(16; "Net Quantity"; Integer)
        {
            Caption = 'NetQty (C)';
        }
        field(17; "Net Value"; Decimal)
        {
            Caption = 'NetValue (D)';
        }
    }

    keys
    {
        key(PK; "Entry No.") { Clustered = true; }
    }
}
