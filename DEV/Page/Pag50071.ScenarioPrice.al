page 50071 "Scenario Price"
{
    ApplicationArea = All;
    Caption = 'Scenario Price Output List';
    PageType = List;
    SourceTable = "Scenario Price";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Asset Token No."; Rec."Asset Token No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Asset Token No. field.', Comment = '%';
                }
                field("Report Date"; Rec."Report Date")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Report Date field.', Comment = '%';
                }
                field("Std Dev (0.995)"; Rec."Std Dev (0.995)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Std Dev (0.995) field.', Comment = '%';
                }
                field("Std Dev (0.94)"; Rec."Std Dev (0.94)")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Std Dev (0.94) field.', Comment = '%';
                }
                field(PSR; Rec.PSR)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the PSR field.', Comment = '%';
                }
                field("Sigma Scaling Factor"; Rec."Sigma Scaling Factor")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Sigma Scaling Factor field.', Comment = '%';
                }
                field(MPOR; Rec.MPOR)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the MPOR field.', Comment = '%';
                }
                field("Series ID"; Rec."Series ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Series ID field.', Comment = '%';
                }
                field("1st Scenario %"; Rec."1st Scenario %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 1st Scenario % field.', Comment = '%';
                }
                field("2nd Scenario %"; Rec."2nd Scenario %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 2nd Scenario % field.', Comment = '%';
                }
                field("3rd Scenario %"; Rec."3rd Scenario %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 3rd Scenario % field.', Comment = '%';
                }
                field("4th Scenario %"; Rec."4th Scenario %")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 4th Scenario % field.', Comment = '%';
                }
                field("Contract Underlying Price"; Rec."Contract Underlying Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Contract Underlying Price field.', Comment = '%';
                }
                field("1st Scenario Price"; Rec."1st Scenario Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 1st Scenario Price field.', Comment = '%';
                }
                field("2nd Scenario Price"; Rec."2nd Scenario Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 2nd Scenario Price field.', Comment = '%';
                }
                field("3rd Scenario Price"; Rec."3rd Scenario Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 3rd Scenario Price field.', Comment = '%';
                }
                field("4th Scenario Price"; Rec."4th Scenario Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the 4th Scenario Price field.', Comment = '%';
                }
            }
        }
    }
}
