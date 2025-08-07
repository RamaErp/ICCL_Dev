// report 50053 ScenarioPrice
// {
//     UsageCategory = ReportsAndAnalysis;
//     Caption = 'Scenario Price';
//     ApplicationArea = All;
//     ProcessingOnly = true;
//     Permissions = tabledata EDX_BC = rmdi;

//     dataset
//     {
//         dataitem(EDX_BC; "Senario Price Input")
//         {

//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin
//                 SenarioPrice.DeleteAll();
//                 //EDX_BC.SetFilter("Report Date", '%1..%2', FromDate, ToDate);
//                 //Sr := 0;
//                 ExcelBuffer.NewRow();
//                 ExcelBuffer.AddColumn('Report Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 //  ExcelBuffer.AddColumn('Expiry Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn('Asset Token No.', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Symbol / Asset Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Standard Deviation (0.995)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Standard Deviation (0.94)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('PSR', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Sigma Scaling factor', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('MPOR', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn('Series ID', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 //ExcelBuffer.AddColumn('Derivative Name', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn('Contract Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn('Call Put', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);  //Added_Praful_19/08/2023
//                 ExcelBuffer.AddColumn('1st Scenario %', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('2nd Scenario %', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('3th Scenario %', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('4th Scenario %', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Contract Underlying settlement price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('1nd Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('2nd Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('3th Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('4th Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//             end;

//             trigger OnAfterGetRecord()
//             var
//                 myInt: Integer;
//                 Sen: Decimal;
//                 Sen1: Decimal;
//                 Sen2: Decimal;
//                 Sen3: Decimal;
//                 Sen4: Decimal;
//                 Sen5: Decimal;
//                 Sen6: Decimal;
//                 Sen7: Decimal;
//                 scenario12: Decimal;
//                 SenPrice1: Decimal;
//                 SenPrice2: Decimal;
//                 SenPrice3: Decimal;
//                 SenPrice4: Decimal;
//             begin
//                 Clear(scenarioPrice1);
//                 Clear(scenarioPrice2);
//                 Clear(scenarioPrice5);
//                 Clear(scenarioPrice6);
//                 Clear(scenario1);
//                 Clear(scenario2);
//                 Clear(scenario5);
//                 Clear(scenario6);
//                 Clear(Sen);
//                 Clear(Sen1);
//                 Sen := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                 sen1 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                 // scenario12 := (Sen + sen1) * 100;
//                 scenario1 := Round((Sen + sen1) * 100, 0.00000100);

//                 Clear(Sen2);
//                 Clear(Sen3);
//                 Sen2 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                 Sen3 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                 scenario2 := Round((Sen2 + sen3) * 100, 0.00000100);
//                 Clear(Sen4);
//                 Clear(Sen5);
//                 Sen4 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                 sen5 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                 scenario5 := Round((Sen4 + sen5) * 100 * -1, 0.00000100);
//                 Clear(Sen6);
//                 Clear(Sen7);
//                 Sen6 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                 Sen7 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                 scenario6 := Round((Sen6 + sen7) * 100 * -1, 0.00000100);


//                 Clear(ContractUnderlinePrice);
//                 //EQDFullSp.Reset();
//                 //  EQDFullSp.SetRange("Asset Token No.", EDX_BC."Asset Token No.");
//                 // if EQDFullSp.FindFirst() then begin
//                 ContractUnderlinePrice := Round(EDX_BC.CovertedUnderlyingprice / 100, 0.00100);
//                 // end;
//                 Clear(SenPrice1);
//                 Clear(SenPrice2);
//                 Clear(SenPrice3);
//                 Clear(SenPrice4);
//                 SenPrice1 := EDX_BC.CovertedUnderlyingprice * scenario1;
//                 SenPrice2 := EDX_BC.CovertedUnderlyingprice * scenario2;
//                 SenPrice3 := EDX_BC.CovertedUnderlyingprice * scenario5;
//                 SenPrice4 := EDX_BC.CovertedUnderlyingprice * scenario6;
//                 scenarioPrice1 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice1 / 100, 0.010);
//                 scenarioPrice2 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice2 / 100, 0.010);
//                 scenarioPrice5 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice3 / 100, 0.010);
//                 scenarioPrice6 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice4 / 100, 0.010);






//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn(EDX_BC."Report Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn(EDX_BC.Expiry, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(EDX_BC."Asset Token No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(EDX_BC."Symbol / Asset Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(EDX_BC."Standard Deviation (0.995)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(EDX_BC."Standard Deviation (0.94)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(EDX_BC.PSR, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(EDX_BC."Sigma Scaling factor", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(EDX_BC.MPOR, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 //  ExcelBuffer.AddColumn(EDX_BC."Series ID", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 //ExcelBuffer.AddColumn(EDX_BC."Derivative Name", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn(EDX_BC."Contract Price", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 // ExcelBuffer.AddColumn(EDX_BC."Call Put", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(scenario1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario5, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario6, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(EDX_BC.CovertedUnderlyingprice, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice5, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice6, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 StoreResult(EDX_BC)
//             end;

//             // trigger OnPostDataItem()
//             // var
//             //     myInt: Integer;
//             // begin
//             //     StoreResult(EDX_BC)
//             // end;
//         }
//     }

//     requestpage
//     {
//         AboutTitle = 'Teaching tip title';
//         AboutText = 'Teaching tip content';
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     // group("Date Filters")
//                     // {
//                     //     field(FromDate; FromDate)
//                     //     {
//                     //         ApplicationArea = All;
//                     //         Caption = 'From Date';
//                     //     }
//                     //     field(ToDate; ToDate)
//                     //     {
//                     //         ApplicationArea = All;
//                     //         Caption = 'To Date';
//                     //     }
//                     // }
//                 }
//             }
//         }

//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName)
//                 {

//                 }
//             }
//         }
//     }




//     var
//         myInt: Integer;
//         ExcelBuffer: Record "Excel Buffer" temporary;
//         FromDate: Date;
//         ToDate: Date;
//         PeriodText1: Text[30];
//         PeriodText: Text[30];
//         scenario1: Decimal;
//         scenario2: Decimal;
//         scenario5: Decimal;
//         scenario6: Decimal;
//         EQDFullSp: Record EQD_FullSp;
//         ContractUnderlinePrice: Decimal;
//         scenarioPrice1: Decimal;
//         scenarioPrice2: Decimal;
//         scenarioPrice5: Decimal;
//         scenarioPrice6: Decimal;
//         SenarioPrice: Record "Scenario Price";

//     trigger OnPreReport()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.DELETEALL;
//         Clear(PeriodText);
//         Clear(PeriodText1);
//         PeriodText := Format(FromDate);
//         PeriodText1 := Format(ToDate);

//         // companyinf.Reset();
//         // if companyinf.FindFirst() then
//         //     CompName := companyinf.Name;

//         MakeExcelInfo();
//         MakeExcelHeader();
//     end;

//     trigger OnPostReport()
//     var
//         myInt: Integer;
//     begin
//         CreateExcel();
//     end;

//     procedure MakeexcelInfo()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.SetUseInfoSheet;
//         ExcelBuffer.AddInfoColumn(COMPANYNAME, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddInfoColumn(USERID, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddInfoColumn(Today, false, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.ClearNewRow;
//     end;

//     procedure MakeExcelHeader()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn('Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         // ExcelBuffer.NewRow();
//         // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn('Details Of Scenario Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//     end;



//     procedure CreateExcel()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.CreateNewExcelBookY('', 'Scenario Price', 'Scenario Price', CompanyName, UserId);
//     end;

//     local procedure StoreResult(EDX_BC: Record "Senario Price Input")
//     var
//         myInt: Integer;
//         SenarioPrice: Record "Scenario Price";
//     begin
//         //  SenarioPrice.DeleteAll();
//         // EDX_BC.Reset();
//         // if EDX_BC.FindSet() then begin
//         //     repeat
//         // SenarioPrice.Reset();
//         // if not SenarioPrice.FindFirst() then begin
//         SenarioPrice.Init();
//         if SenarioPrice.FindLast() then
//             SenarioPrice."Entry No." := SenarioPrice."Entry No." + 1;
//         SenarioPrice."Report Date" := EDX_BC."Report Date";
//         SenarioPrice."Asset Token No." := EDX_BC."Asset Token No.";
//         SenarioPrice."Std Dev (0.995)" := EDX_BC."Standard Deviation (0.995)";
//         SenarioPrice."Std Dev (0.94)" := EDX_BC."Standard Deviation (0.94)";
//         SenarioPrice.PSR := EDX_BC.PSR;
//         SenarioPrice."Sigma Scaling Factor" := EDX_BC."Sigma Scaling factor";
//         SenarioPrice.MPOR := EDX_BC.MPOR;
//         // SenarioPrice."Series ID" := EDX_BC.se;
//         SenarioPrice."1st Scenario %" := scenario1;
//         SenarioPrice."2nd Scenario %" := scenario2;
//         SenarioPrice."3rd Scenario %" := scenario5;
//         SenarioPrice."4th Scenario %" := scenario6;
//         SenarioPrice."1st Scenario Price" := scenarioPrice1;
//         SenarioPrice."2nd Scenario Price" := scenarioPrice2;
//         SenarioPrice."3rd Scenario Price" := scenarioPrice5;
//         SenarioPrice."4th Scenario Price" := scenarioPrice6;
//         SenarioPrice.Insert();
//         // until EDX_BC.Next() = 0;
//         // end;
//     end;
//     //  Message('Data Inserted');
//     //end;
// }