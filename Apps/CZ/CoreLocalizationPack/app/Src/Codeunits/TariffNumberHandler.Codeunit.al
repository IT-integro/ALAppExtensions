#if not CLEAN22
#pragma warning disable AL0432
codeunit 31027 "Tariff Number Handler CZL"
{
    ObsoleteState = Pending;
    ObsoleteTag = '22.0';
    ObsoleteReason = 'Intrastat related functionalities are moved to Intrastat extensions.';

    [EventSubscriber(ObjectType::Table, Database::"Tariff Number", 'OnAfterDeleteEvent', '', false, false)]
    local procedure DeleteStatisticIndicationCZLOnAfterDeleteTariffNumber(var Rec: Record "Tariff Number")
    var
        StatisticIndicationCZL: Record "Statistic Indication CZL";
    begin
        if Rec.IsTemporary() then
            exit;
        StatisticIndicationCZL.SetRange("Tariff No.", Rec."No.");
        StatisticIndicationCZL.DeleteAll();
    end;

    [EventSubscriber(ObjectType::Table, Database::"Unit of Measure", 'OnAfterDeleteEvent', '', false, false)]
    local procedure UpdateSupplUnitofMeasCodeCZLOnDeleteUnitofMeasure(var Rec: Record "Unit of Measure")
    var
        TariffNumber: Record "Tariff Number";
    begin
        if Rec.IsTemporary() then
            exit;
        TariffNumber.SetCurrentKey("Suppl. Unit of Meas. Code CZL");
        TariffNumber.SetRange("Suppl. Unit of Meas. Code CZL", Rec.Code);
        TariffNumber.ModifyAll("Supplementary Units", false);
        TariffNumber.ModifyAll("Suppl. Unit of Meas. Code CZL", '');
    end;
}
#pragma warning restore AL0432
#endif