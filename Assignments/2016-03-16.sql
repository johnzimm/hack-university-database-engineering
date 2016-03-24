SELECT *
FROM crimedataraw AS a
INNER JOIN crimedataraw AS b
ON a.neighborhood = b.neighborhood LIMIT 50000;

SELECT *
FROM crimedataraw AS a
INNER JOIN crimedataraw AS b
ON a.report_time = b.report_time LIMIT 50000;

create index ix_reportTime on crimedataraw (report_time);
drop index ix_reportTime;

SELECT *
FROM crimedataraw AS a
INNER JOIN crimedataraw AS b
ON a.report_time = b.report_time;


1a.Create a table called Words with all 26^3 3 character letter combinations and the structure:  ID, word
1b.Pull back * where word = 'me%' using in, like, regex, and left.
1c.Create an index on word and re-execute the queries from 1b.  What happed to the execution time and plan?

2a.Create a correlated nested subquery on Words.  Look at the execution plan and time.
2b.Drop the query and reexamine the results.

3.Create a regex to match email addresses.

4.Create a regex to match all words from Words that only contain vowels.  That contain exactly two vowels.

5.Replace multiple spaces in a sentence with a single word using a regex replace.

6.Make an acronym from a sentence using a regex.