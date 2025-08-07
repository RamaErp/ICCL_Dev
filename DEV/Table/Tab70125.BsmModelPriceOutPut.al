table 70125 "BSM Model Pricing Uotput"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sr. No."; Integer) { }
        field(2; "Report Date"; Date) { }
        field(3; "Expiry Date"; Date) { }
        field(4; "Series ID"; Code[20]) { }
        field(5; "Call Put"; Option)
        {
            Caption = 'Call Put';
            OptionMembers = P,C,F; // Assuming only Put and Call
            OptionCaption = 'P,C,F';
        }
        field(6; "Asset Code"; Code[20]) { }
        field(7; "Actual Spot Rate"; Decimal) { }
        field(8; "Revised Spot Rate S1"; Decimal) { }
        field(9; "Revised Spot Rate S2"; Decimal) { }
        field(10; "Revised Spot Rate S3"; Decimal) { }
        field(11; "Revised Spot Rate S4"; Decimal) { }
        field(12; "Strike Rate"; Integer) { }
        field(13; "Time to Expiration"; Decimal) { }
        field(14; "Rate"; Decimal) { }
        field(15; "Volatility (v)"; Decimal) { }
        field(16; "d1 SC1A"; Decimal) { }
        field(17; "d2 SC1A"; Decimal) { }
        field(18; "Call Price SC1A"; Decimal) { }
        field(19; "Put Price SC1A"; Decimal) { }
        field(20; "d1 SC1B"; Decimal) { }
        field(21; "d2 SC1B"; Decimal) { }
        field(22; "Call Price SC1B"; Decimal) { }
        field(23; "Put Price SC1B"; Decimal) { }
        field(24; "d1 SC2A"; Decimal) { }
        field(25; "d2 SC2A"; Decimal) { }
        field(26; "Call Price SC2A"; Decimal) { }
        field(27; "Put Price SC2A"; Decimal) { }
        field(28; "d1 SC2B"; Decimal) { }
        field(29; "d2 SC2B"; Decimal) { }
        field(30; "Call Price SC2B"; Decimal) { }
        field(31; "Put Price SC2B"; Decimal) { }
        field(32; "Future Price SC1A"; Decimal) { }
        field(33; "Future Price SC1B"; Decimal) { }
        field(34; "Future Price SC2A"; Decimal) { }
        field(35; "Future Price SC2B"; Decimal) { }
        field(36; "Scenario3PriceMax"; Decimal) { }
        field(37; "Scenario4PriceMax"; Decimal) { }
    }

    keys
    {
        key(PK; "Sr. No.") { Clustered = true; }
    }

    //  fieldgroups
    //  {
    //      fieldgroup(DropDown; "Sr. No.", "Report Date", "Asset Code", "Call Put", "Series ID")
    //  }
}
