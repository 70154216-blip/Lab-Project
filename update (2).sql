
UPDATE Books 
SET available_copies = available_copies - 1 
WHERE book_id = 1 AND available_copies > 0;


UPDATE Members 
SET phone_number = '555-9999' 
WHERE member_id = 1;