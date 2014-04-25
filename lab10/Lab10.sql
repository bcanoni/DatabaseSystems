-- Brian Canoni
-- 4/25/2014

-- 1.function PreReqsFor(courseNum) - Returns immediate prereqs for the passed-in course no.


--I am strugling with these so I am not sure these worked at all

create or replace function PreReqsFor(int) returns refcursor as
$$
declare
  CourseNum int := $1;
  results refcursor := 'result';
begin
  open results for
    select c.num, c.name
    from courses c
    where num in(
      select p.preReqNum
      from prerequisites p
      where p.courseNum = queriedCourseNum
    );
  return results;
end;
$$
language plpgsql;

commit;
begin;
select PreReqsFor(449);
fetch all from result;

-- 2. function IsPreReqFor(courseNum) ­ Returns the courses for which the passed-­-in course --numberis an immediate pre-­-requisite.

--This one gave me a hard time and I am still not sure if it is working correctly 

create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as 
$$
declare
  course_num	int		:= $1;
  results	REFCURSOR	:= 'result';
begin
  open results for
    select c2.name, c2.num, c2.credits
      from courses c1, courses c2, prerequisites p
		where course_num = c1.num
		   and c1.num = p.prereqnum
		   and p.coursenum = c2.num;
	return results;
end;
$$
language plpgsql;

select IsPreReqFor(120);
Fetch all from result;