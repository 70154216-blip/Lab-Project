UPDATE Loans 
SET return_date = CURRENT_DATE 
WHERE loan_id = 101;

-- Don't forget to restore the book inventory:
UPDATE Books SET available_copies = available_copies + 1 WHERE book_id = 1;