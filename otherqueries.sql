SELECT
F.FirmaAd as [Firma Adı],F.Yetkili as Temsilci, COUNT(*) as [Toplam Operation] FROM Firma F  left outer join OperationExport Oe on Oe.fkShipper=F.pkFirma
where YEAR(Oe.PolTarihi)= YEAR('2021-12-03') and Oe.fkHouse>0 GROUP BY F.FirmaAd,F.Yetkili
UNION

SELECT
F.FirmaAd as [Firma Adı],F.Yetkili as Temsilci, COUNT(*) as [Toplam Operation] FROM Operation O  right join Firma F on O.fkConsignee=F.pkFirma
where YEAR(O.PolTarihi)= YEAR('2021-12-03') and O.fkHouse>0 GROUP BY F.FirmaAd,F.Yetkili
UNION

SELECT F.FirmaAd ,F.Yetkili,COUNT(O.PolTarihi) as [Toplam Operation] from Firma F left outer join Operation O on O.fkConsignee=F.pkFirma  group by F.FirmaAd,F.Yetkili
UNION ALL

SELECT F.FirmaAd ,F.Yetkili,COUNT(DISTINCT O.PolTarihi)+COUNT(Oe.PolTarihi) as [Toplam Operation] from Firma F  left outer join Operation O on O.fkConsignee=F.pkFirma  left outer join OperationExport Oe on Oe.fkShipper=F.pkFirma group by F.FirmaAd,F.Yetkili


SELECT F.FirmaAd ,F.Yetkili,COUNT(O.PolTarihi) as [Toplam Operation] from Firma F left outer join Operation O on O.fkConsignee=F.pkFirma  group by F.FirmaAd,F.Yetkili
UNION

SELECT F.FirmaAd ,F.Yetkili,COUNT(Oe.PolTarihi) as [Toplam Operation] from Firma F left outer join OperationExport Oe on Oe.fkShipper=F.pkFirma  group by F.FirmaAd,F.Yetkili

SELECT F.FirmaAd ,F.Yetkili,COUNT(Oe.PolTarihi) as [Toplam Operation]from Firma F left  join Operation O on O.fkConsignee=F.pkFirma left join OperationExport Oe on F.pkFirma=Oe.fkShipper  group by F.FirmaAd,F.Yetkili