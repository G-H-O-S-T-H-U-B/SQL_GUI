alter proc student_name
@roll_no int, @name nvarchar(MAX)
as
begin 
select * from Students
where [Roll no] = @roll_no or [Name] = @name
end

exec student_name 10, 'zuned'

select * from [Students]