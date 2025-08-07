page 50041 EQD_FullSp_List
{
    ApplicationArea = All;
    Caption = 'EQD_FullSp_List';
    PageType = List;
    SourceTable = EQD_FullSp;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Series Code"; Rec."Series Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Seried Code field.', Comment = '%';
                    Caption = 'Series Code';
                }
                field("Derivative Name"; Rec."Derivative Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Derivative Name field.', Comment = '%';
                }

                field("Contarct Price"; Rec."Contarct Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Contarct Price field.', Comment = '%';
                }
                field("Contarct Underline Price"; Rec."Contarct Underline Price")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Contarct Underline Price field.', Comment = '%';
                }
                field("Asset Token No."; Rec."Asset Token No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Asset Token No. field.', Comment = '%';
                }

            }
        }
    }
}
