page 50073 "Final Stress Loss Input List"
{
    PageType = List;
    SourceTable = "Final Stress Loss Inputs";
    Caption = 'Final Stress Loss Input List';
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("CmCode"; Rec."CmCode") { ApplicationArea = All; }
                field("TmCode"; Rec."TmCode") { ApplicationArea = All; }
                field("Client Code"; Rec."Client Code") { ApplicationArea = All; }
                field("Product Type"; Rec."Product Type") { ApplicationArea = All; }
                field("Series ID"; Rec."Series ID") { ApplicationArea = All; }
                field("Strike Price"; Rec."Strike Price") { ApplicationArea = All; }
                field("Call/Put"; Rec."Call/Put") { ApplicationArea = All; }
                field("Asset Code"; Rec."Asset Code") { ApplicationArea = All; }
                field("Series Code"; Rec."Series Code") { ApplicationArea = All; }
                field("Market Lot"; Rec."Market Lot") { ApplicationArea = All; }
                field("Underlying ID"; Rec."Underlying ID") { ApplicationArea = All; }
                field("Previous Close Price"; Rec."Pre Day Close Price") { ApplicationArea = All; }
                field("Today Close Price"; Rec."Today Close Price") { ApplicationArea = All; }
                field("CP Code"; Rec."CP Code") { ApplicationArea = All; }
                field("Net Quantity"; Rec."Net Quantity") { ApplicationArea = All; }
                field("Net Value"; Rec."Net Value") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // Add processing actions here if needed
        }
    }
}
