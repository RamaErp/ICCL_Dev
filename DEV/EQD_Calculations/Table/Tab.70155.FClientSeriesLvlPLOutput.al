table 70155 "ClientSeriesLvlPLOutput"
{
    DataClassification = ToBeClassified;
    Caption = 'Client Series Level Profit Loss OutPut';

    fields
    {
        field(1; "Sr. No."; Integer) { DataClassification = SystemMetadata; }
        field(2; "Cm Code"; Code[10]) { }
        field(3; "Tm Code"; Code[10]) { }
        field(4; "Client Code"; Code[20]) { }
        field(5; "Product Type"; Code[10]) { }
        field(6; "Series Id"; Code[20]) { }
        field(7; "Strike Price"; Decimal) { }
        field(8; "CallPut"; Option)
        {
            OptionMembers = F,P,C;
        }
        field(9; "Asset Code"; Code[10]) { }
        field(10; "Series Code"; Code[20]) { }
        field(11; "Market Lot"; Integer) { }
        field(12; "Underlying Id"; Code[20]) { }
        field(13; "Pre Day Close Price"; Decimal) { }
        field(14; "Today Close Price"; Decimal) { }
        field(15; "CP Code"; Code[20]) { }
        field(16; "Net Qty"; Integer) { }
        field(17; "Net Value"; Decimal) { }
        field(18; "Net Value on Today Close Price"; Decimal) { }
        field(19; "Scenario 1A (Increase)"; Decimal) { }
        field(20; "Scenario 1B (Increase)"; Decimal) { }
        field(21; "Scenario 2A (Decrease)"; Decimal) { }
        field(22; "Scenario 2B (Decrease)"; Decimal) { }
        field(23; "Scenario 3 Price Max"; Decimal) { }
        field(24; "Scenario 4 Price Max"; Decimal) { }
        field(25; "Net Value on Scenario 1A"; Decimal) { }
        field(26; "Net Value on Scenario 1B"; Decimal) { }
        field(27; "Net Value on Scenario 2A"; Decimal) { }
        field(28; "Net Value on Scenario 2B"; Decimal) { }
        field(29; "Net Value on Scenario 3"; Decimal) { }
        field(30; "Net Value on Scenario 4"; Decimal) { }
        field(31; "Profit/Loss on Scenario 1A"; Decimal) { }
        field(32; "Profit/Loss on Scenario 1B"; Decimal) { }
        field(33; "Profit/Loss on Scenario 2A"; Decimal) { }
        field(34; "Profit/Loss on Scenario 2B"; Decimal) { }
        field(35; "Profit/Loss on Scenario 3"; Decimal) { }
        field(36; "Profit/Loss on Scenario 4"; Decimal) { }
    }

    keys
    {
        key(PK; "Sr. No.") { Clustered = true; }
    }
}
