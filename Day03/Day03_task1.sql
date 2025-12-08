with
    dim_elf         as (select * from [edw].[DimElf]),
    dim_elf_dummy   as (select * from [edw].[DimElf_wDummyRow]),
    task01          as (
        SELECT ElfKey
        from dim_elf_dummy
        WHERE ElfKey NOT IN (select ElfKey from dim_elf)
    ),
    task02          as (
        SELECT HireDateKey
        from dim_elf_dummy
        WHERE ElfKey NOT IN (select ElfKey from dim_elf)
    ),
    FactElfTime as (SELECT * from [dbo].[factElfTime]),
    task03 as (
        SELECT COUNT(*) as CountWithDummyRows
        from [dbo].[factElfTime] as fet
        INNER join task01 as t1
        ON fet.ElfKey = t1.ElfKey
    ),
    task04 as (
        SELECT SUM([WorkedHours]) as WorkedHourshDummyRows
        from [dbo].[factElfTime] as fet
        INNER join task01 as t1
        ON fet.ElfKey = t1.ElfKey
    )

-- select * from task01;
-- select * from task02;
-- select * from task03;
select * from task04;