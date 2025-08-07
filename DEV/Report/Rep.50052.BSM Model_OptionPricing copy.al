// report 50052 "BSM Model_Option Pricing"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem(Option_Pricing; Option_Pricing)
//         {

//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin

//                 //Option_Pricing.SetFilter("Report Date", '%1..%2', FromDate, ToDate);
//                 Sr := 0;
//                 ExcelBuffer.NewRow();
//                 ExcelBuffer.AddColumn('Sr.No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Report Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Expiry Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Series ID', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Put', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Asset Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Actual Spot Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Revised Spot Rate * (Price pulled from "Scenario Price" excel "INPUT" sheet)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(' ', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Strike Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Time to Expiration', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Volatility', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      Future Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

//                 ExcelBuffer.NewRow();
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     X', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     T', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     R', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     V', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow();
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
//                 DayDifference: Integer;
//                 timetoExpiration: Decimal;
//                 lnValue: Decimal;
//                 lnValue1: Decimal;
//                 lnValue2: Decimal;
//                 lnValue3: Decimal;
//                 lnValue4: Decimal;
//                 lnValue5: Decimal;
//                 lnValue6: Decimal;
//                 lnValue7: Decimal;
//                 lnValue8: Decimal;
//                 ValueD2: Decimal;
//                 ValueD21: Decimal;
//                 ValueD22: Decimal;
//                 SC1ACellPrice: Decimal;
//                 SC1ACellPrice1: Decimal;
//                 SC1ACellPrice2: Decimal;
//                 SC1ACellPrice3: Decimal;
//             begin
//                 Sr += 1;
//                 Clear(timetoExpiration);
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
//                 Sen := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing.PSR * Power(Option_Pricing.MPOR, 1 / 2);
//                 sen1 := Option_Pricing."Standard Deviation (0.94)" * Option_Pricing."Sigma Scaling factor" * Power(Option_Pricing.MPOR, 1 / 2);
//                 // scenario12 := (Sen + sen1) * 100;
//                 scenario1 := Round((Sen + sen1) * 100, 0.00000100);
//                 Clear(Sen2);
//                 Clear(Sen3);
//                 Sen2 := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing.PSR * Power(Option_Pricing.MPOR, 1 / 2);
//                 Sen3 := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing."Sigma Scaling factor" * Power(Option_Pricing.MPOR, 1 / 2);
//                 scenario2 := Round((Sen2 + sen3) * 100, 0.00000100);
//                 Clear(Sen4);
//                 Clear(Sen5);
//                 Sen4 := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing.PSR * Power(Option_Pricing.MPOR, 1 / 2);
//                 sen5 := Option_Pricing."Standard Deviation (0.94)" * Option_Pricing."Sigma Scaling factor" * Power(Option_Pricing.MPOR, 1 / 2);
//                 scenario5 := Round((Sen4 + sen5) * 100 * -1, 0.00000100);
//                 Clear(Sen6);
//                 Clear(Sen7);
//                 Sen6 := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing.PSR * Power(Option_Pricing.MPOR, 1 / 2);
//                 Sen7 := Option_Pricing."Standard Deviation (0.995)" * Option_Pricing."Sigma Scaling factor" * Power(Option_Pricing.MPOR, 1 / 2);
//                 scenario6 := Round((Sen6 + sen7) * 100 * -1, 0.00000100);

//                 DayDifference := Option_Pricing.Expiry - Option_Pricing."Report Date";
//                 timetoExpiration := DayDifference / 365;

//                 //  lnValue := Logarithm(2, 10);                
//                 // lnValue1 := CalculateLn(434.85 / 340.00); /// (0.240190407)
//                 // lnValue6 := 7 + (0.52488900 * 0.52488900) / 2; ///(0.1377542312)
//                 // lnValue2 := lnValue6 * 0.079452;
//                 // lnValue3 := lnValue1 + lnValue2;
//                 // lnValue4 := 0.524889 * Power(0.079452, 1 / 2);
//                 // lnValue5 := lnValue3 / lnValue4;
//                 Clear(lnValue);
//                 Clear(lnValue1);
//                 Clear(lnValue2);
//                 Clear(lnValue3);
//                 Clear(lnValue4);
//                 Clear(lnValue5);
//                 Clear(lnValue6);
//                 Clear(lnValue7);
//                 Clear(lnValue8);
//                 Clear(ValueD2);
//                 Clear(ValueD21);

//                 // if DayDifference <> 0 then begin
//                 //     lnValue := 0.52488900 * 0.52488900;
//                 //     lnValue1 := lnValue / 2;
//                 //     lnValue2 := lnValue1 * 100;
//                 //     lnValue3 := Round(lnValue2 + 7, 0.01);
//                 //     lnValue4 := lnValue3 * DayDifference;
//                 //     lnValue8 := lnValue4 / 100;
//                 //     lnValue5 := CalculateLn(434.85 / 340.00) + lnValue8;
//                 //     lnValue6 := Power(DayDifference, 1 / 2) * 0.52488900;
//                 //     lnValue7 := lnValue5 / lnValue6;
//                 // end;

//                 // ValueD2 := Power(DayDifference, 1 / 2) * 0.52488900;
//                 // ValueD21 := lnValue7 - ValueD2;

//                 lnValue := 0.52488900 * 0.52488900;
//                 lnValue1 := lnValue / 2;
//                 lnValue2 := lnValue1 * 100;
//                 lnValue3 := Round(lnValue2 + 7, 0.01);
//                 lnValue4 := lnValue3 * 0.079452;
//                 lnValue8 := lnValue4 / 100;
//                 lnValue5 := CalculateLn(434.85 / 340.00) + lnValue8;
//                 lnValue6 := Power(0.079452, 1 / 2) * 0.52488900;
//                 lnValue7 := lnValue5 / lnValue6;

//                 ValueD2 := Power(0.079452, 1 / 2) * 0.52488900;
//                 ValueD21 := lnValue7 - ValueD2;

//                 SC1ACellPrice := 434.85 * NORMSDIST(1.77465) - 340.00;
//                 SC1ACellPrice1 := Exp(-7 * 0.079452 * NORMSDIST(1.62670));
//                 SC1ACellPrice2 := Round(SC1ACellPrice * SC1ACellPrice1, 0.05);
//                 SC1ACellPrice3 := MaxValue(SC1ACellPrice2, 0.05);

//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(Option_Pricing."Report Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(Option_Pricing.Expiry, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(Option_Pricing."Series ID", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(Option_Pricing."Call Put", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(Option_Pricing."Asset Token No.", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(scenario1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario5, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenario6, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(timetoExpiration, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn('7.00', FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(lnValue7, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(ValueD21, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);



//                 //ExcelBuffer.AddColumn(ItemTenantMedia.Content, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 //  ExcelBuffer.AddPicture(1, 2, PictureStream, 'Item Picture', 2, 2);  // Width: 150, Height: 150

//             end;
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
//         Sr: Integer;
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
//         Item: Record Item;
//         TempBlob: Codeunit "Temp Blob";
//         Instr: InStream;
//         OutStr: OutStream;
//         Picture: Guid;
//         ItemPicture: Page "Item Picture";
//         ItemTenantMedia: Record "Tenant Media";

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
//         ExcelBuffer.AddColumn('BSM Model_OptionPricing', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         // ExcelBuffer.NewRow();
//         // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn('Details BSM Model_OptionPricing', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//     end;



//     procedure CreateExcel()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.CreateNewExcelBookY('', 'BSM Model_OptionPricing', 'BSM Model_OptionPricing', CompanyName, UserId);
//     end;


//     procedure Logarithm(Number: Decimal; Base: Decimal): Decimal;
//     var
//         NaturalLogNumber: Decimal;
//         NaturalLogBase: Decimal;
//     begin
//         if Number <= 0 then
//             Error('The number must be greater than 0.');

//         if Base <= 0 then
//             Error('The base must be greater than 0.');

//         // Calculate natural logarithms using an approximation method
//         NaturalLogNumber := CalculateNaturalLog(Number);
//         NaturalLogBase := CalculateNaturalLog(Base);

//         // Logarithm of Number with the specified base
//         exit(NaturalLogNumber / NaturalLogBase);
//     end;

//     procedure CalculateNaturalLog(X: Decimal): Decimal;
//     var
//         PreviousValue: Decimal;
//         CurrentValue: Decimal;
//         Difference: Decimal;
//         Iterations: Integer;
//         MaxIterations: Integer;
//     begin
//         // Newton's method for approximating natural log
//         PreviousValue := 0;
//         CurrentValue := X - 1; // Start approximation from (X - 1)
//         Difference := CurrentValue - PreviousValue;
//         Iterations := 0;
//         MaxIterations := 1000; // Set a maximum number of iterations

//         while (ABS(Difference) > 0.000001) and (Iterations < MaxIterations) do begin
//             PreviousValue := CurrentValue;
//             CurrentValue := PreviousValue - ((Exp(PreviousValue) - X) / Exp(PreviousValue)); // Newton's method step
//             Difference := CurrentValue - PreviousValue;
//             Iterations += 1;
//         end;

//         exit(CurrentValue);
//     end;



//     procedure CalculateLnOfTwo(): Decimal
//     var
//         ln2Approximation: Decimal;
//         n: Integer;
//         term, x : Decimal;
//     begin
//         ln2Approximation := 0;
//         x := (2 - 1); // for ln(2), x = 1 (because ln(1+x) = ln(2) when x = 1)

//         // Calculate using a simple Taylor series expansion for ln(1+x)
//         for n := 1 to 100 do begin
//             term := Power(x, n) / n; // Calculate each term of the series
//             if n mod 2 = 0 then
//                 ln2Approximation -= term // Subtract even terms
//             else
//                 ln2Approximation += term; // Add odd terms
//         end;

//         // Message('Approximated natural logarithm of 2: %1', ln2Approximation);
//         exit(ln2Approximation);
//     end;

//     // procedure CalculateLn(x: Decimal): Decimal
//     // var
//     //     lnApproximation: Decimal;
//     //     n: Integer;
//     //     term, y : Decimal;
//     // begin
//     //     if x <= 0 then begin
//     //         Error('Natural logarithm is undefined for non-positive numbers.');
//     //     end;

//     //     lnApproximation := 0;
//     //     y := (x - 1) / (x + 1); // Change of variable for faster convergence (y = (x-1)/(x+1))

//     //     // Calculate using a Taylor series expansion for ln(x)
//     //     for n := 1 to 100 step 2 do begin
//     //         term := Power(y, n) / n; // Calculate each term of the series for odd n
//     //         lnApproximation += 2 * term; // Multiply by 2 due to change of variable
//     //     end;

//     //     Message('Approximated natural logarithm of %1: %2', x, lnApproximation);
//     //     exit(lnApproximation);
//     // end;

//     procedure CalculateLn(x: Decimal): Decimal
//     var
//         lnApproximation: Decimal;
//         n: Integer;
//         term, y : Decimal;
//     begin
//         if x <= 0 then begin
//             Error('Natural logarithm is undefined for non-positive numbers.');
//         end;

//         lnApproximation := 0;
//         y := (x - 1) / (x + 1); // Change of variable for faster convergence (y = (x-1)/(x+1))

//         // Calculate using a Taylor series expansion for ln(x)
//         n := 1;
//         while n <= 100 do begin
//             term := Power(y, n) / n; // Calculate each term of the series for odd n
//             lnApproximation += 2 * term; // Multiply by 2 due to change of variable
//             n := n + 2; // Increment n by 2 to consider only odd numbers
//         end;

//         //Message('Approximated natural logarithm of %1: %2', x, lnApproximation);
//         exit(lnApproximation);
//     end;

//     procedure InsertImageInExcel()
//     var
//         ImageStream: InStream;
//         FilePath: Text;
//         FileManagement: Codeunit "File Management";


//     begin
//         // Load your image from a file or Blob into a stream
//         // FilePath := 'C:\Images\Logo.png';
//         // if FileManagement.BLOBImportWithFilter(FilePath, ImageStream) then begin
//         // Handle stream to load into Excel using external library or extension
//         // Use EPPlus or OpenXML library to work with Excel files directly.
//         // end;
//     end;

//     procedure NORMSDIST(x: Decimal): Decimal;
//     var
//         pi: Decimal;
//         erfResult: Decimal;
//     begin
//         // Constant values
//         pi := 3.14159265359;

//         // Approximation of the cumulative normal distribution using the error function (erf)
//         erfResult := ERF(x / Power(2, 1 / 2));
//         //Power(2, 1 / 2)

//         // Calculate the NORMSDIST result
//         exit(0.5 * (1 + erfResult));
//     end;

//     procedure ERF(x: Decimal): Decimal;
//     var
//         t: Decimal;
//         z: Decimal;
//         tau: Decimal;
//     begin
//         // Using an approximation formula for the error function (erf)
//         t := 1 / (1 + 0.3275911 * ABS(x));
//         z := t * (0.254829592 - t * (0.284496736 - t * (1.421413741 - t * (1.453152027 - t * 1.061405429))));

//         tau := 1 - z * EXP(-x * x);
//         if x >= 0 then
//             exit(tau)
//         else
//             exit(-tau);
//     end;

//     procedure Exp(X: Decimal): Decimal;
//     var
//         Result: Decimal;
//         Term: Decimal;
//         i: Integer;
//     begin
//         // Exponential series approximation: e^x = 1 + x + x^2/2! + x^3/3! + ...
//         Result := 1;
//         Term := 1;
//         for i := 1 to 100 do begin
//             Term := (Term * X) / i;
//             Result := Result + Term;
//         end;

//         exit(Result);
//     end;

//     procedure MaxValue(a: Decimal; b: Decimal): Decimal;
//     begin
//         if a > b then
//             exit(a)
//         else
//             exit(b);
//     end;

// }