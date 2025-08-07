table 70253 "CD_Client Level P&L Output"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sr. No"; Integer) { DataClassification = CustomerContent; }
        field(2; "CmCode"; Integer) { DataClassification = CustomerContent; }
        field(3; "TmCode"; Integer) { DataClassification = CustomerContent; }
        field(4; "Client Code"; Code[20]) { DataClassification = CustomerContent; }

        // Profit/Loss Fields
        field(5; "Profit On Scenario1A"; Decimal) { }
        field(6; "Profit On Scenario1B"; Decimal) { }
        field(7; "Profit On Scenario2A"; Decimal) { }
        field(8; "Profit On Scenario2B"; Decimal) { }
        field(9; "Profit On Scenario3"; Decimal) { }
        field(10; "Profit On Scenario4"; Decimal) { }

        field(11; "Margin"; Decimal) { }

        // Net Loss Fields
        field(12; "NetLoss On Scenario1A"; Decimal) { }
        field(13; "NetLoss On Scenario1B"; Decimal) { }
        field(14; "NetLoss On Scenario2A"; Decimal) { }
        field(15; "NetLoss On Scenario2B"; Decimal) { }
        field(16; "NetLoss On Scenario3"; Decimal) { }
        field(17; "NetLoss On Scenario4"; Decimal) { }
    }

    keys
    {
        key(PK; "Sr. No") { Clustered = true; }
    }
}
